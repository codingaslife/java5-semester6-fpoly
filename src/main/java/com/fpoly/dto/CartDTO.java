package com.fpoly.dto;

import com.fpoly.entity.CartDetail;
import com.fpoly.entity.User;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.Date;
import java.util.List;
import java.util.UUID;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class CartDTO {

  private UUID id;

  private String code;

  private Date createdDate;

  private Integer state;

  private User user;

  private List<CartDetail> cartDetails;

  private UUID token;
}
