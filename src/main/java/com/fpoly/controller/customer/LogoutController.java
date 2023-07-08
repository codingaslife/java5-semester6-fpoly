package com.fpoly.controller.customer;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/customer")
public class LogoutController {

  @GetMapping("/logout")
  public String showFormLogin(HttpServletRequest request, HttpServletResponse response) {
    Cookie uEmail = new Cookie("email", "");
    uEmail.setMaxAge(0);
    Cookie uPassword = new Cookie("password", "");
    uPassword.setMaxAge(0);
    response.addCookie(uEmail);
    response.addCookie(uPassword);
    request.getSession().removeAttribute("customerUser");
    request.getSession().removeAttribute("cart");
    request.getSession().removeAttribute("cartDetail");
    request.getSession().removeAttribute("invoice");
    return "redirect:/customer/login";
  }
}
