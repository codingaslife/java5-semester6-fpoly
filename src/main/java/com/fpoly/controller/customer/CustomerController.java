package com.fpoly.controller.customer;

import com.fpoly.dto.CartDTO;
import com.fpoly.dto.CartDetailDTO;
import com.fpoly.dto.CityDTO;
import com.fpoly.dto.DistrictDTO;
import com.fpoly.dto.InvoiceDTO;
import com.fpoly.dto.InvoiceDetailDTO;
import com.fpoly.dto.ProductDTO;
import com.fpoly.dto.UserDTO;
import com.fpoly.entity.Cart;
import com.fpoly.entity.CartDetail;
import com.fpoly.entity.Invoice;
import com.fpoly.entity.Product;
import com.fpoly.entity.User;
import com.fpoly.exception.RestApiException;
import com.fpoly.service.impl.CartDetailServiceImpl;
import com.fpoly.service.impl.InvoiceDetailServiceImpl;
import com.fpoly.service.impl.InvoiceServiceImpl;
import com.fpoly.service.impl.ProductServiceImpl;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.data.domain.Page;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.math.BigDecimal;
import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/customer")
public class CustomerController {

  @Autowired
  private ProductServiceImpl productService;

  @Autowired
  private CartDetailServiceImpl cartDetailService;

  @Autowired
  private InvoiceServiceImpl invoiceService;

  @Autowired
  private InvoiceDetailServiceImpl invoiceDetailService;

  @Autowired
  private ModelMapper modelMapper;

  @GetMapping("/home")
  public String viewHome(Model model, HttpServletResponse response, HttpServletRequest request, HttpSession session) {
    model.addAttribute("products", productService.getAll());
    return "/customer/index";
  }

  @GetMapping("/products")
  public String viewProducts(Model model, @RequestParam(value = "currentPage", defaultValue = "1") Integer currentPage) {
    Page<Product> pages = productService.getAllPage(currentPage);
    model.addAttribute("products", pages.getContent());
    model.addAttribute("totalPages", pages.getTotalPages());
    model.addAttribute("currentPage", currentPage);
    return "/customer/products";
  }

  @GetMapping("/order/search")
  public String searchOrder(Model model, HttpSession session, @RequestParam(value = "code", required = false, defaultValue = "") String code) {
    UserDTO userDTO = (UserDTO) session.getAttribute("customerUser");
    if (userDTO == null) {
      if (code == null || code.isBlank()) {
        model.addAttribute("errorMessage", "Vui lòng nhập vào mã đơn hàng");
        return "/customer/order-search";
      }
      InvoiceDTO invoiceResponse = invoiceService.findInvoiceByCode(code);
      if (invoiceResponse == null) {
        model.addAttribute("notFound", "Không tìm thấy đơn hàng với mã là " + code);
        return "/customer/order-search";
      }
      model.addAttribute("invoice", invoiceResponse);
      return "/customer/order-search";
    }
    List<InvoiceDTO> invoiceResponse = invoiceService.findInvoiceByUser(userDTO.getId());
    model.addAttribute("orders", invoiceResponse);
    return "/customer/order";
  }

  @GetMapping("/order-detail")
  public String viewOrderDetail(@RequestParam(value = "id", defaultValue = "") UUID id, Model model, HttpSession session) {
    List<InvoiceDetailDTO> invoiceDetailDTOS = invoiceDetailService.findInvoiceDetailByInvoice(id);
    model.addAttribute("orderDetails", invoiceDetailDTOS);
    return "/customer/order-detail";
  }

  @GetMapping("/order")
  public String viewOrder(Model model, HttpSession session) {
    UserDTO userDTO = (UserDTO) session.getAttribute("customerUser");
    if (userDTO != null) {
      List<InvoiceDTO> invoiceResponse = invoiceService.findInvoiceByUser(userDTO.getId());
      model.addAttribute("orders", invoiceResponse);
      return "/customer/order";
    } else {
      return "/customer/order-search";
    }
  }

  @GetMapping("/cart")
  public String viewCart(Model model, HttpSession session) {
    CartDTO cartDTO = (CartDTO) session.getAttribute("cart");
    List<CartDetailDTO> cartDetailsResponse = cartDetailService.findProductInCart(cartDTO.getId());
    session.setAttribute("cartDetail", cartDetailsResponse);
    return "/customer/cart";
  }

  @GetMapping("/order-success")
  public String viewOrderSuccess(HttpSession session, Model model) {
    CartDTO cartDTO = (CartDTO) session.getAttribute("cart");
    List<CartDetailDTO> cartDetailsResponse = cartDetailService.findProductInCart(cartDTO.getId());
    session.setAttribute("cartDetail", cartDetailsResponse);
    return "/customer/order-success";
  }

  @PostMapping("/order-success")
  public String processFormOrder(Model model, HttpSession session, RedirectAttributes redirectAttributes,
                                 @Valid @ModelAttribute("invoice") InvoiceDTO invoiceDTO, BindingResult result) {
    if (result.hasErrors()) {
      return "customer/payment";
    }
    List<CartDetailDTO> checkCartItem = (List<CartDetailDTO>) session.getAttribute("cartDetail");
    if (checkCartItem.size() == 0) {
      return "customer/cart";
    }
    // Tìm giỏ hàng hiện tại
    CartDTO cartDTO = (CartDTO) session.getAttribute("cart");
    // Tìm giỏ hàng chi tiết hiện tại của giỏ hàng
    List<CartDetail> cartDetails = cartDetailService.findProductInCart1(cartDTO.getId());
    // Tìm user hiện tại
    UserDTO userDTO = (UserDTO) session.getAttribute("customerUser");
    if (userDTO == null) {
      // Convert sang entity
      Invoice convertInvoice = modelMapper.map(invoiceDTO, Invoice.class);
      // Save invoice mới và convert sang DTO
      InvoiceDTO newInvoice = invoiceService.save(convertInvoice, null);
      // Convert sang entity
      Invoice getInvoice = modelMapper.map(newInvoice, Invoice.class);
      // Save hóa đơn chi tiết
      invoiceDetailService.save(getInvoice, cartDetails);
      // Remove toàn bộ product trong giỏ hàng chi tiết
      cartDetailService.deleteAllCartItemByCartWhenPayment(cartDTO.getId());

      // Update lại hóa đơn
      InvoiceDTO findInvoiceByCode = invoiceService.findInvoiceByCode(getInvoice.getCode());
      if (findInvoiceByCode == null) {
        throw new RestApiException("Có lỗi xảy ra, không tìm thấy đơn hàng này!");
      }
      List<InvoiceDetailDTO> invoiceDetailDTOS = invoiceDetailService.findInvoiceDetailByInvoice(getInvoice.getId());
      BigDecimal totalPrice = BigDecimal.ZERO;
      Integer totalQuantity = 0;
      for (InvoiceDetailDTO detail : invoiceDetailDTOS) {
        totalPrice = totalPrice.add(detail.getPrice());
        totalQuantity += detail.getQuantity();
      }
      findInvoiceByCode.setTotalQuantity(totalQuantity);
      findInvoiceByCode.setTotalMoney(totalPrice.add(findInvoiceByCode.getShipFee()));
      InvoiceDTO updateInvoice = invoiceService.saveDefault(findInvoiceByCode);

      // Update lại session của giỏ hàng chi tiết
      List<CartDetailDTO> cartDetailsResponse = cartDetailService.findProductInCart(cartDTO.getId());
      session.setAttribute("invoice", updateInvoice);
      session.setAttribute("cartDetail", cartDetailsResponse);
    } else {
      // Convert sang entity
      User userConvert = modelMapper.map(userDTO, User.class);
      // Convert sang entity
      Invoice convertInvoice = modelMapper.map(invoiceDTO, Invoice.class);
      // Save invoice mới và convert sang DTO
      InvoiceDTO newInvoice = invoiceService.save(convertInvoice, userConvert);
      // Convert sang entity
      Invoice getInvoice = modelMapper.map(newInvoice, Invoice.class);
      // Save hóa đơn chi tiết
      invoiceDetailService.save(getInvoice, cartDetails);
      // Remove toàn bộ product trong giỏ hàng chi tiết
      cartDetailService.deleteAllCartItemByCartWhenPayment(cartDTO.getId());

      // Update lại hóa đơn
      InvoiceDTO findInvoiceByCode = invoiceService.findInvoiceByCode(getInvoice.getCode());
      if (findInvoiceByCode == null) {
        throw new RestApiException("Có lỗi xảy ra, không tìm thấy đơn hàng này!");
      }
      List<InvoiceDetailDTO> invoiceDetailDTOS = invoiceDetailService.findInvoiceDetailByInvoice(getInvoice.getId());
      BigDecimal totalPrice = BigDecimal.ZERO;
      Integer totalQuantity = 0;
      for (InvoiceDetailDTO detail : invoiceDetailDTOS) {
        totalPrice = totalPrice.add(detail.getPrice());
        totalQuantity += detail.getQuantity();
      }
      findInvoiceByCode.setTotalQuantity(totalQuantity);
      findInvoiceByCode.setTotalMoney(totalPrice.add(findInvoiceByCode.getShipFee()));
      InvoiceDTO updateInvoice = invoiceService.saveDefault(findInvoiceByCode);

      // Update lại session của giỏ hàng chi tiết
      List<CartDetailDTO> cartDetailsResponse = cartDetailService.findProductInCart(cartDTO.getId());
      session.setAttribute("invoice", updateInvoice);
      session.setAttribute("cartDetail", cartDetailsResponse);
    }
    return "redirect:/customer/order-success";
  }

  @GetMapping("/district")
  @ResponseBody
  public List<DistrictDTO> getDistrictByCity(
          @RequestParam(value = "code") String code) {
    RestTemplate restTemplate = new RestTemplate();
    String apiUrl = "http://localhost:8080/api/district";
    ResponseEntity<List<DistrictDTO>> response = restTemplate.exchange(
            apiUrl,
            HttpMethod.GET,
            null,
            new ParameterizedTypeReference<List<DistrictDTO>>() {
            }
    );
    List<DistrictDTO> districtDTOS = response.getBody();
    List<DistrictDTO> filteredDistricts = districtDTOS.stream()
            .filter(district -> district.getParent_code().equals(code))
            .collect(Collectors.toList());
    return filteredDistricts;
  }

  @GetMapping("/payment")
  public String viewPayment(Model model, HttpSession session) {
    RestTemplate restTemplate = new RestTemplate();
    String apiUrl = "http://localhost:8080/api/citys";
    ResponseEntity<List<CityDTO>> response = restTemplate.exchange(
            apiUrl,
            HttpMethod.GET,
            null,
            new ParameterizedTypeReference<List<CityDTO>>() {
            }
    );
    List<CityDTO> cityDTOS = response.getBody();
    model.addAttribute("citys", cityDTOS);
    model.addAttribute("invoice", new InvoiceDTO());
    CartDTO cartDTO = (CartDTO) session.getAttribute("cart");
    List<CartDetailDTO> cartDetailsResponse = cartDetailService.findProductInCart(cartDTO.getId());
    session.setAttribute("cartDetail", cartDetailsResponse);
    return "/customer/payment";
  }

  @GetMapping("/cart/delete-all")
  public String deleteAllCartItem(HttpSession session) {
    CartDTO cartDTO = (CartDTO) session.getAttribute("cart");
    cartDetailService.deleteAllCartItemByCart(cartDTO.getId());
    List<CartDetailDTO> cartDetailsResponse = cartDetailService.findProductInCart(cartDTO.getId());
    session.setAttribute("cartDetail", cartDetailsResponse);
    return "redirect:/customer/cart";
  }

  @GetMapping("/cart/delete/{cartDetailId}")
  public String deleteCartItem(HttpSession session,
                               @PathVariable(value = "cartDetailId") String cartDetailID) {
    Boolean isResult = cartDetailService.deleteCartItemByDeleteInCart(UUID.fromString(cartDetailID));
    CartDTO cartDTO = (CartDTO) session.getAttribute("cart");
    List<CartDetailDTO> cartDetailsResponse = cartDetailService.findProductInCart(cartDTO.getId());
    session.setAttribute("cartDetail", cartDetailsResponse);
    return "redirect:/customer/cart";
  }

  @GetMapping("/product/detail/{code}")
  public String viewProductDetail(@PathVariable(value = "code", required = false) String productCode, Model model) {
    ProductDTO productDTO = productService.findProductByCode(productCode);
    model.addAttribute("product", productDTO);
    model.addAttribute("products", productService.getAll());
    return "/customer/detail";
  }

  @GetMapping("/add-to-cart-by-quantity")
  @ResponseBody
  public List<CartDetailDTO> addProductToCartByQuantity(@RequestParam("productCode") String productCode
          , HttpSession session, HttpServletRequest request
          , @RequestParam(value = "quantity", required = false, defaultValue = "1") Integer quantity) {
    CartDTO cartDTO = (CartDTO) session.getAttribute("cart");
    Cart cart = modelMapper.map(cartDTO, Cart.class);
    CartDetail cartDetail = cartDetailService.addToCartByQuantity(productCode, cart, quantity);
    List<CartDetailDTO> cartDetailsResponse = cartDetailService.findProductInCart(cartDTO.getId());
    session.setAttribute("cartDetail", cartDetailsResponse);
    return cartDetailsResponse;
  }

  @GetMapping("/add-to-cart")
  @ResponseBody
  public List<CartDetailDTO> addProductToCart(@RequestParam("productCode") String productCode
          , HttpSession session, HttpServletRequest request) {
    CartDTO cartDTO = (CartDTO) session.getAttribute("cart");
    Cart cart = modelMapper.map(cartDTO, Cart.class);
    CartDetail cartDetail = cartDetailService.addToCartDefault(productCode, cart);
    List<CartDetailDTO> cartDetailsResponse = cartDetailService.findProductInCart(cartDTO.getId());
    session.setAttribute("cartDetail", cartDetailsResponse);
    return cartDetailsResponse;
  }

  @GetMapping("/change-quantity-by-input/cart-item")
  @ResponseBody
  public CartDetailDTO loadDataCartItemByInput(@RequestParam("cartDetailId") String cartDetailID,
                                               @RequestParam(value = "quantity", required = false) Integer quantity
          , HttpSession session) {
    CartDTO cartDTO = (CartDTO) session.getAttribute("cart");
    CartDetailDTO cartDetailDTO = cartDetailService.findCartDetailByIdAndSetQuantityByInput(UUID.fromString(cartDetailID), quantity);
    List<CartDetailDTO> cartDetailsResponse = cartDetailService.findProductInCart(cartDTO.getId());
    session.setAttribute("cartDetail", cartDetailsResponse);
    cartDetailDTO.setCartItems(cartDetailsResponse);
    return cartDetailDTO;
  }

  @GetMapping("/change-quantity-by-button/cart-item")
  @ResponseBody
  public CartDetailDTO loadDataCartItemByButton(@RequestParam("cartDetailId") String cartDetailID,
                                                @RequestParam(value = "quantity", required = false) Integer quantity,
                                                @RequestParam("isPlus") Boolean isPlus
          , HttpSession session) {
    CartDTO cartDTO = (CartDTO) session.getAttribute("cart");
    CartDetailDTO cartDetailDTO = cartDetailService.findCartDetailByIdAndSetQuantityByButton(UUID.fromString(cartDetailID), quantity, isPlus);
    List<CartDetailDTO> cartDetailsResponse = cartDetailService.findProductInCart(cartDTO.getId());
    session.setAttribute("cartDetail", cartDetailsResponse);
    cartDetailDTO.setCartItems(cartDetailsResponse);
    return cartDetailDTO;
  }
}
