package com.fpoly.service;

import com.fpoly.dto.CartDTO;
import com.fpoly.entity.Cart;
import com.fpoly.entity.User;

import java.util.UUID;

public interface CartService {

//  List<CartDTO> getAll();

  CartDTO save(User user);

  CartDTO saveCartByUserNonRegister(UUID token);

  CartDTO findCartByUser(UUID code);

  CartDTO findCartByToken(UUID token);

  String prefixCode();
}
