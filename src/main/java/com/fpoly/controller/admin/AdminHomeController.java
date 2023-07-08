package com.fpoly.controller.admin;

import com.fpoly.service.impl.UserServiceImpl;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminHomeController {

  @Autowired
  private UserServiceImpl userService;

  @GetMapping("/home")
  public String viewHome(HttpServletRequest request, Model model,
                         HttpSession session) {
    if (session.getAttribute("adminUser") == null){
        return "redirect:/admin/login";
    }
    return "/admin/index";
  }

  @GetMapping("/orders")
  public String viewOrders(HttpServletRequest request, Model model,
                         HttpSession session) {
    return "/admin/saleslist";
  }

}
