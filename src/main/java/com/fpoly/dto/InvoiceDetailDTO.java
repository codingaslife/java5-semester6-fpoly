package com.fpoly.dto;

import com.fpoly.entity.Invoice;
import com.fpoly.entity.Product;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.math.BigDecimal;
import java.util.UUID;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class InvoiceDetailDTO {

  private UUID id;

  private Integer quantity;

  private BigDecimal price;

  private Product product;

  private Invoice invoice;

}
