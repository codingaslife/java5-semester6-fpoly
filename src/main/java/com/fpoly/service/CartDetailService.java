package com.fpoly.service;

import com.fpoly.dto.CartDetailDTO;
import com.fpoly.entity.Cart;
import com.fpoly.entity.CartDetail;

import java.util.List;
import java.util.UUID;

public interface CartDetailService {

  CartDetail addToCartDefault(String productCode, Cart cart);

  List<CartDetailDTO> findProductInCart(UUID cartId);

  CartDetailDTO findCartDetailByIdAndSetQuantityByButton(UUID id, Integer quantity, Boolean isPlus);

  CartDetailDTO findCartDetailByIdAndSetQuantityByInput(UUID id, Integer quantity);

  CartDetail addToCartByQuantity(String productCode, Cart cart, Integer quantity);

  Boolean deleteCartItemByDeleteInCart(UUID id);

  List<CartDetail> findProductInCart1(UUID cartId);

  void deleteAllCartItemByCart(UUID id);

  void deleteAllCartItemByCartWhenPayment(UUID id);
}
