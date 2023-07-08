package com.fpoly.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class CartDetailDTO {

  private UUID id;

  private UUID productId;

  private String productCode;

  private Integer quantity;

  private Date createdAt;

  private BigDecimal totalPrice;

  private String totalPriceVND;

  private BigDecimal price;

  private String productImage;

  private String productName;

  private BigDecimal totalPriceCart;

  private String totalPriceCartVND;

  private List<CartDetailDTO> cartItems;
//  private Cart cart;
  //  //
//  private Product product;
}
