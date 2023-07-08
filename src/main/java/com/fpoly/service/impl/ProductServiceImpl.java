package com.fpoly.service.impl;

import com.fpoly.dto.ProductDTO;
import com.fpoly.entity.Product;
import com.fpoly.exception.RestApiException;
import com.fpoly.repository.ProductRepository;
import com.fpoly.service.ProductService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class ProductServiceImpl implements ProductService {

  @Autowired
  private ProductRepository productRepository;

  @Autowired
  private ModelMapper modelMapper;

  @Override
  public List<ProductDTO> getAll() {
    return productRepository.findAll().stream().map(p -> modelMapper.map(p, ProductDTO.class)).collect(Collectors.toList());
  }

  @Override
  public ProductDTO findProductByCode(String code) {
    Product product = productRepository.findProductByCode(code);
    if (product == null) {
      throw new RestApiException("Không tìm thấy sản phẩm này!");
    }
    ProductDTO productResponse = modelMapper.map(product, ProductDTO.class);
    return productResponse;
  }

  @Override
  public Page<Product> getAllPage(Integer currentPage) {
    Pageable pageable = PageRequest.of(currentPage - 1, 12);
    return productRepository.findAll(pageable);
  }
}
