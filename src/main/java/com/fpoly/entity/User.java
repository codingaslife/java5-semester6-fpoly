package com.fpoly.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.JdbcTypeCode;

import java.sql.Types;
import java.util.List;
import java.util.UUID;

@Entity
@Table(name = "__User")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
@ToString
public class User {

  @Id
  @GeneratedValue(generator = "uuid2")
  @GenericGenerator(name = "uuid2", strategy = "uuid2")
  @JdbcTypeCode(Types.VARCHAR)
  private UUID id;

  private String code;

  private String fullName;

  private String email;

  private String password;

  private Boolean gender;

  private String dateOfBirth;

  private String address;

  private String phone;

  private Integer state;

  @ManyToOne(fetch = FetchType.LAZY)
  @JoinColumn(name = "RoleId", referencedColumnName = "Id")
  private Role role;

  @OneToMany(fetch = FetchType.LAZY, mappedBy = "user")
  private List<Cart> carts;

}
