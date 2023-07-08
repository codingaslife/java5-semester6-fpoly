package com.fpoly.controller.customer;

import com.fpoly.entity.Product;
import com.fpoly.repository.ProductRepository;
import com.fpoly.repository.RoleRepository;
import com.fpoly.repository.UserRepository;
import com.fpoly.service.impl.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class TestController {

  @Autowired
  private UserServiceImpl userService;

  @Autowired
  private UserRepository userRepository;
  @Autowired
  private RoleRepository roleRepository;

  @Autowired
  private ProductRepository productRepository;

  @GetMapping("/test")
  public String viewHome(Model model) {
    model.addAttribute("products", productRepository.findAll());
//    model.addAttribute("users", userRepository.findAll());
////    model.addAttribute("roles", roleRepository.findAll());
    return "/test";
  }

  @GetMapping("/add")
  public String add(Model model) {
    List<Product> products = productRepository.findAll();
    Product product = new Product();
    String prefix = "pr_00000";
    product.setCode(products.isEmpty() ? "pr_000001" : prefix + productRepository.productCodePrefixGenerateSQL());
    productRepository.save(product);
    model.addAttribute("products", productRepository.findAll());
    return "/test";
  }
}
