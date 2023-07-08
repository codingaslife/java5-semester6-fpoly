package com.fpoly.controller.customer;

import com.fpoly.dto.CartDTO;
import com.fpoly.dto.CartDetailDTO;
import com.fpoly.dto.UserDTO;
import com.fpoly.entity.User;
import com.fpoly.service.impl.CartDetailServiceImpl;
import com.fpoly.service.impl.CartServiceImpl;
import com.fpoly.service.impl.UserServiceImpl;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/customer")
public class RegisterController {

  @Autowired
  private UserServiceImpl userService;

  @Autowired
  private CartServiceImpl cartService;

  @Autowired
  private CartDetailServiceImpl cartDetailService;

  @Autowired
  private ModelMapper modelMapper;

  @GetMapping("/register")
  public String showFormRegister(Model model, HttpServletRequest request) {
    if (request.getSession().getAttribute("customerUser") != null) {
      return "redirect:/customer/home";
    }
    model.addAttribute("UserRegister", new UserDTO());
    return "/customer/register";
  }

  @GetMapping("/register/success")
  public String loginSuccess() {
    return "/customer/register-success";
  }

  @PostMapping("/register")
  public String processRegisterForm(@Valid @ModelAttribute("User") UserDTO userDTO
          , BindingResult result
          , HttpSession session
          , Model model) {
    if (session.getAttribute("customerUser") != null) {
      return "redirect:/customer/home";
    }
    if (result.hasErrors()) {
      return "/customer/register";
    }
    UserDTO userResponse = userService.registerCustomerUser(userDTO);
    User user = modelMapper.map(userResponse, User.class);
    CartDTO cartResponse = cartService.save(user);
    List<CartDetailDTO> cartDetailsResponse = cartDetailService.findProductInCart(cartResponse.getId());
    session.setAttribute("cartDetail", cartDetailsResponse);
    session.setAttribute("customerUser", userResponse);
    session.setAttribute("cart", cartResponse);
    return "redirect:/customer/register/success";
  }
}
