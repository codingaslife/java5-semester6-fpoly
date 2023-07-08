package com.fpoly.repository;

import com.fpoly.entity.CartDetail;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface CartDetailRepository extends JpaRepository<CartDetail, UUID> {

  @Query("select cd from CartDetail cd left join fetch cd.product" +
          " where cd.cart.id = ?1" +
          " order by cd.createdAt DESC")
  List<CartDetail> findProductInCartDetail(UUID cartId);

  @Query("select cd from CartDetail cd left join cd.product" +
          " where cd.id = ?1")
  CartDetail findCartDetailById(UUID id);

  @Query("select cd from CartDetail cd left join fetch cd.product where cd.product.code = ?1 and cd.cart.code = ?2")
  CartDetail findProductExistsInCartDetail(String productCode, String cartCode);

}
