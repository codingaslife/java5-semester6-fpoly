package com.fpoly.repository;

import com.fpoly.entity.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface ProductRepository extends JpaRepository<Product, UUID> {

  @Query(nativeQuery = true, value = "SELECT MAX(TRY_CAST(SUBSTRING(code, 4, LEN(code) - 3) AS INT)) + 1\n" +
          "FROM product")
  String productCodePrefixGenerateSQL();

  Product findProductByCode(String code);

  @Query("select p from Product p")
  List<Product> getAll();

}
