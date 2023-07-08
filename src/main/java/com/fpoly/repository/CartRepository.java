package com.fpoly.repository;

import com.fpoly.entity.Cart;
import com.fpoly.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface CartRepository extends JpaRepository<Cart, UUID> {

  @Query("select c from Cart c left join fetch c.cartDetails")
  List<User> getAll();

  @Query(nativeQuery = true, value = "SELECT MAX(TRY_CAST(SUBSTRING(code, 6, LEN(code) - 5) AS INT)) + 1\n" +
          "FROM cart")
  String cartCodePrefixGenerateSQL();

  @Query("select c from Cart c left join fetch c.cartDetails where c.user.id = ?1")
  Cart findCartByUser(UUID id);

  @Query("select c from Cart c left join fetch c.cartDetails where c.token = ?1")
  Cart findCartByToken(UUID token);
}
