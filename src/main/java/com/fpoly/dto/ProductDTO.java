package com.fpoly.dto;

import com.fpoly.entity.CartDetail;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.math.BigDecimal;
import java.util.List;
import java.util.UUID;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ProductDTO {
  private UUID id;

  private String code;

  private String name;

  private String description;

  private Integer quantityInStock;

  private BigDecimal price;

  private String size;

  private String image;

  private Integer state;

  private List<CartDetail> cartDetail;

}
