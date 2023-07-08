package com.fpoly.dto;

import com.fpoly.entity.User;
import jakarta.validation.constraints.NotBlank;
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
public class InvoiceDTO {

  private UUID id;

  private String code;

  private Date createdDate;

  private Integer state;

  private User user;

  private String note;

  @NotBlank(message = "Họ và tên không được trống")
  private String RecipientName;

  @NotBlank(message = "Địa chỉ không được trống")
  private String ReceiveAddress;

  @NotBlank(message = "Số điện thoại không được trống")
  private String RecipientPhoneNumber;

  private List<InvoiceDetailDTO> invoiceDetails;

  private BigDecimal totalMoney;

  private BigDecimal shipFee;

  private Integer totalQuantity;
}

