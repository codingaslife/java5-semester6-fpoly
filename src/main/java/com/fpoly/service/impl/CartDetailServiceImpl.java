package com.fpoly.service.impl;

import com.fpoly.dto.CartDetailDTO;
import com.fpoly.entity.Cart;
import com.fpoly.entity.CartDetail;
import com.fpoly.entity.Product;
import com.fpoly.exception.RestApiException;
import com.fpoly.repository.CartDetailRepository;
import com.fpoly.repository.ProductRepository;
import com.fpoly.service.CartDetailService;
import com.fpoly.utils.ConvertCurrency;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Service
public class CartDetailServiceImpl implements CartDetailService {

  @Autowired
  private ProductRepository productRepository;

  @Autowired

  private CartDetailRepository cartDetailRepository;

  @Autowired
  private ModelMapper modelMapper;

  @Override
  public List<CartDetail> findProductInCart1(UUID cartId) {
    List<CartDetail> cartDetails = cartDetailRepository.findProductInCartDetail(cartId);
    return cartDetails;
  }

  @Override
  public CartDetail addToCartDefault(String productCode, Cart cart) {
    CartDetail findProductExists = cartDetailRepository.findProductExistsInCartDetail(productCode, cart.getCode());
    if (findProductExists == null) {
      Product product = productRepository.findProductByCode(productCode);
      product.setQuantityInStock(product.getQuantityInStock() - 1);
      CartDetail cartDetail = new CartDetail();
      cartDetail.setProduct(product);
      cartDetail.setCart(cart);
      cartDetail.setPrice(product.getPrice());
      cartDetail.setQuantity(1);
      cartDetail.setCreatedAt(new Date());
      return cartDetailRepository.save(cartDetail);
    } else {
      findProductExists.getProduct().setQuantityInStock(findProductExists.getProduct().getQuantityInStock() - 1);
      findProductExists.setQuantity(findProductExists.getQuantity() + 1);
      findProductExists.setPrice(findProductExists.getProduct().getPrice().multiply(BigDecimal.valueOf(findProductExists.getQuantity())));
      return cartDetailRepository.save(findProductExists);
    }
  }

  @Override
  public List<CartDetailDTO> findProductInCart(UUID cartId) {
    List<CartDetail> cartDetails = cartDetailRepository.findProductInCartDetail(cartId);
    List<CartDetailDTO> cartDetailsResponse = new ArrayList<>();
    for (CartDetail c : cartDetails) {
      CartDetailDTO cartDetailDTO = new CartDetailDTO();
      cartDetailDTO.setId(c.getId());
      cartDetailDTO.setProductId(c.getProduct().getId());
      cartDetailDTO.setQuantity(c.getQuantity());
      cartDetailDTO.setProductImage(c.getProduct().getImage());
      cartDetailDTO.setTotalPrice(c.getPrice());
      cartDetailDTO.setProductName(c.getProduct().getName());
      cartDetailDTO.setProductCode(c.getProduct().getCode());
      cartDetailDTO.setTotalPriceVND(ConvertCurrency.FormatCurrencyVND(c.getPrice()));
      cartDetailsResponse.add(cartDetailDTO);
    }
    return cartDetailsResponse;
//    return cartDetails.stream().map(c -> modelMapper.map(c, CartDetailDTO.class)).collect(Collectors.toList());
  }

  @Override
  public CartDetailDTO findCartDetailByIdAndSetQuantityByButton(UUID id, Integer quantity, Boolean isPlus) {
    CartDetail cartDetail = cartDetailRepository.findCartDetailById(id);
    cartDetail.setQuantity(quantity);
    cartDetail.setPrice(cartDetail.getProduct().getPrice().multiply(BigDecimal.valueOf(quantity)));
    if (isPlus) {
      cartDetail.getProduct().setQuantityInStock(cartDetail.getProduct().getQuantityInStock() - 1);
    } else {
      cartDetail.getProduct().setQuantityInStock(cartDetail.getProduct().getQuantityInStock() + 1);
    }
    cartDetailRepository.save(cartDetail);
    CartDetailDTO cartDetailDTO = modelMapper.map(cartDetail, CartDetailDTO.class);
    cartDetailDTO.setTotalPriceVND(ConvertCurrency.FormatCurrencyVND(cartDetailDTO.getPrice()));
    return cartDetailDTO;
  }

  @Override
  public CartDetailDTO findCartDetailByIdAndSetQuantityByInput(UUID id, Integer quantity) {
    CartDetail cartDetail = cartDetailRepository.findCartDetailById(id);
    cartDetail.setPrice(cartDetail.getProduct().getPrice().multiply(BigDecimal.valueOf(quantity)));
    cartDetail.getProduct().setQuantityInStock((cartDetail.getProduct().getQuantityInStock() - quantity) + cartDetail.getQuantity());
    cartDetail.setQuantity(quantity);
    cartDetailRepository.save(cartDetail);
    CartDetailDTO cartDetailDTO = modelMapper.map(cartDetail, CartDetailDTO.class);
    cartDetailDTO.setTotalPriceVND(ConvertCurrency.FormatCurrencyVND(cartDetailDTO.getPrice()));
    return cartDetailDTO;
  }

  @Override
  public CartDetail addToCartByQuantity(String productCode, Cart cart, Integer quantity) {
    CartDetail findProductExists = cartDetailRepository.findProductExistsInCartDetail(productCode, cart.getCode());
    if (findProductExists == null) {
      Product product = productRepository.findProductByCode(productCode);
      product.setQuantityInStock(product.getQuantityInStock() - quantity);
      CartDetail cartDetail = new CartDetail();
      cartDetail.setProduct(product);
      cartDetail.setCart(cart);
      cartDetail.setPrice(product.getPrice().multiply(BigDecimal.valueOf(quantity)));
      cartDetail.setQuantity(quantity);
      cartDetail.setCreatedAt(new Date());
      return cartDetailRepository.save(cartDetail);
    } else {
      findProductExists.getProduct().setQuantityInStock((findProductExists.getProduct().getQuantityInStock() - quantity));
      findProductExists.setQuantity(findProductExists.getQuantity() + quantity);
      findProductExists.setPrice(findProductExists.getProduct().getPrice().multiply(BigDecimal.valueOf(findProductExists.getQuantity())));
      return cartDetailRepository.save(findProductExists);
    }
  }

  @Override
  public void deleteAllCartItemByCartWhenPayment(UUID id) {
    List<CartDetail> cartDetails = cartDetailRepository.findProductInCartDetail(id);
    for (CartDetail c : cartDetails) {
      cartDetailRepository.delete(c);
    }
  }

  @Override
  public void deleteAllCartItemByCart(UUID id) {
    List<CartDetail> cartDetails = cartDetailRepository.findProductInCartDetail(id);
    for (CartDetail c : cartDetails) {
      c.getProduct().setQuantityInStock(c.getProduct().getQuantityInStock() + c.getQuantity());
      cartDetailRepository.delete(c);
    }
  }

  @Override
  public Boolean deleteCartItemByDeleteInCart(UUID id) {
    CartDetail cartDetail = cartDetailRepository.findCartDetailById(id);
    if (cartDetail == null) {
      throw new RestApiException("Sản phẩm này không còn trong giỏ hàng nữa!");
    }
    cartDetail.getProduct().setQuantityInStock(cartDetail.getProduct().getQuantityInStock() + cartDetail.getQuantity());
    cartDetailRepository.delete(cartDetail);
    return true;
  }
}
