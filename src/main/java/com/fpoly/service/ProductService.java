package com.fpoly.service;

import com.fpoly.dto.ProductDTO;
import com.fpoly.entity.Product;
import org.springframework.data.domain.Page;

import java.util.List;

public interface ProductService {

  List<ProductDTO> getAll();

  ProductDTO findProductByCode(String code);

  Page<Product> getAllPage(Integer currentPage);

}
