package com.fpoly.entity;

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
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.JdbcTypeCode;

import java.sql.Types;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Entity
@Table(name = "Cart")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Cart {

  @Id
  @GeneratedValue(generator = "uuid2")
  @GenericGenerator(name = "uuid2", strategy = "uuid2")
  @JdbcTypeCode(Types.VARCHAR)
  private UUID id;

  private String code;

  private Date createdDate;

  private Integer state;

  private UUID token;

  @ManyToOne(fetch = FetchType.LAZY)
  @JoinColumn(name = "UserId", referencedColumnName = "Id")
  private User user;

  @OneToMany(fetch = FetchType.LAZY, mappedBy = "cart")
  private List<CartDetail> cartDetails;

}

