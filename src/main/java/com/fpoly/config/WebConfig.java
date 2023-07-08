package com.fpoly.config;

import com.fpoly.config.filter.CustomerInterceptor;
import com.fpoly.service.CartDetailService;
import com.fpoly.service.CartService;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Component
public class WebConfig implements WebMvcConfigurer {

  private final CartService cartService;
  private final CartDetailService cartDetailService;

  public WebConfig(CartService cartService, CartDetailService cartDetailService) {
    this.cartService = cartService;
    this.cartDetailService = cartDetailService;
  }

  @Override
  public void addInterceptors(InterceptorRegistry registry) {
    registry.addInterceptor(new CustomerInterceptor(cartService, cartDetailService)).addPathPatterns("/customer/**");
  }
}
