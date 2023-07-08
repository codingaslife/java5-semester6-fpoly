package com.fpoly.config.filter;

import com.fpoly.dto.CartDTO;
import com.fpoly.dto.CartDetailDTO;
import com.fpoly.service.CartDetailService;
import com.fpoly.service.CartService;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import java.util.List;
import java.util.UUID;

@Component
public class CustomerInterceptor implements HandlerInterceptor {

  private CartService cartService;
  private CartDetailService cartDetailService;

  public CustomerInterceptor(CartService cartService, CartDetailService cartDetailService) {
    this.cartService = cartService;
    this.cartDetailService = cartDetailService;
  }

  @Override
  public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
    String uri = request.getRequestURI();
    if (uri.equals("/customer/order")) {
      request.getSession().removeAttribute("invoice");
    }
    if (uri.startsWith("/customer/")) {
      if (request.getSession().getAttribute("customerUser") == null) {
        Cookie[] cookies = request.getCookies();
        String cartToken = "";
        boolean cartFound = false;
        if (cookies != null) {
          for (Cookie c : cookies) {
            if (c.getName().equals("cart")) {
              if (c.getMaxAge() != 0) {
                cartToken = c.getValue();
                CartDTO cartResponse = cartService.findCartByToken(UUID.fromString(cartToken));
                request.getSession().setAttribute("cart", cartResponse);
                List<CartDetailDTO> cartDetailsResponse = cartDetailService.findProductInCart(cartResponse.getId());
                request.getSession().setAttribute("cartDetail", cartDetailsResponse);
                cartFound = true;
              }
            }
          }
        }
        if (!cartFound) {
          cartToken = String.valueOf(UUID.randomUUID());
          Cookie uCart = new Cookie("cart", cartToken);
          uCart.setMaxAge(8640000);
          response.addCookie(uCart);
          CartDTO cartResponse = cartService.saveCartByUserNonRegister(UUID.fromString(cartToken));
          request.getSession().setAttribute("cart", cartResponse);
          List<CartDetailDTO> cartDetailsResponse = cartDetailService.findProductInCart(cartResponse.getId());
          request.getSession().setAttribute("cartDetail", cartDetailsResponse);
        }
      }
    }
    return true;
  }
}
