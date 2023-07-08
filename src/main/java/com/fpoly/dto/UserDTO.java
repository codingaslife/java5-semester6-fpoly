package com.fpoly.dto;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fpoly.entity.Role;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotEmpty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.UUID;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class UserDTO {
  private UUID id;

  private String code;

  @NotBlank(message = "Họ tên không được để trống")
  private String fullName;

  @Email(message = "Email sai định dạng")
  private String email;

  @NotEmpty(message = "Mật khẩu không được để trống")
  private String password;

  private String address;

  @NotBlank(message = "SDT không được để trống")
  private String phone;

  private Role role;
}
