package com.fpoly.service.impl;

import com.fpoly.dto.CartDTO;
import com.fpoly.entity.Cart;
import com.fpoly.entity.User;
import com.fpoly.exception.RestApiException;
import com.fpoly.repository.CartRepository;
import com.fpoly.service.CartService;
import com.fpoly.utils.ObjectPrefixCode;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.UUID;

@Service
public class CartServiceImpl implements CartService {

  @Autowired
  private CartRepository cartRepository;

  @Autowired
  private ModelMapper modelMapper;

//  @Override
//  public List<UserDTO> getAll() {
//    return cartRepository.getAll().stream().map(u -> modelMapper.map(u, UserDTO.class)).collect(Collectors.toList());
//  }

  @Override
  public CartDTO save(User user) {
    Cart cart = new Cart();
    cart.setCode(prefixCode());
    cart.setState(1);
    cart.setCreatedDate(new Date());
    cart.setUser(user);
    cartRepository.save(cart);
    CartDTO cartResponse = findCartByUser(user.getId());
    return cartResponse;
  }

  @Override
  public CartDTO saveCartByUserNonRegister(UUID token) {
    Cart cart = new Cart();
    cart.setCode(prefixCode());
    cart.setState(1);
    cart.setCreatedDate(new Date());
    cart.setUser(null);
    cart.setToken(token);
    cartRepository.save(cart);
    CartDTO cartResponse = modelMapper.map(cart, CartDTO.class);
    return cartResponse;
  }

  @Override
  public CartDTO findCartByUser(UUID id) {
    Cart cart = cartRepository.findCartByUser(id);
    if (cart == null) {
      throw new RuntimeException("Error");
    }
    CartDTO cartResponse = modelMapper.map(cart, CartDTO.class);
    return cartResponse;
  }

  @Override
  public CartDTO findCartByToken(UUID token) {
    Cart cart = cartRepository.findCartByToken(token);
    if (cart == null) {
      throw new RestApiException("Lỗi không xác định");
    }
    CartDTO cartResponse = modelMapper.map(cart, CartDTO.class);
    return cartResponse;
  }

  @Override
  public String prefixCode() {
    return cartRepository.findAll().isEmpty() ? ObjectPrefixCode.CART_CODE + 1 : ObjectPrefixCode.CART_CODE + cartRepository.cartCodePrefixGenerateSQL();
  }
}
