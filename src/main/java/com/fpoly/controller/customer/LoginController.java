package com.fpoly.controller.customer;

import com.fpoly.dto.CartDTO;
import com.fpoly.dto.CartDetailDTO;
import com.fpoly.dto.UserDTO;
import com.fpoly.service.impl.CartDetailServiceImpl;
import com.fpoly.service.impl.CartServiceImpl;
import com.fpoly.service.impl.UserServiceImpl;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@RequestMapping("/customer")
public class LoginController {

  @Autowired
  private CartServiceImpl cartService;

  @Autowired
  private CartDetailServiceImpl cartDetailService;

  @Autowired
  private UserServiceImpl userService;

  @GetMapping("/login")
  public String showLoginForm(HttpServletRequest request, Model model,
                              HttpSession session) {
    if (request.getSession().getAttribute("customerUser") != null) {
      return "redirect:/customer/home";
    }
    Cookie[] cookies = request.getCookies();
    if (cookies != null) {
      for (Cookie c : cookies) {
        if (c.getName().equals("emailLogin")) {
          if (c.getMaxAge() != 0) {
            model.addAttribute("email", c.getValue());
            model.addAttribute("remember", true);
          }
        }
        if (c.getName().equals("passwordLogin")) {
          if (c.getMaxAge() != 0) {
            model.addAttribute("password", c.getValue());
            model.addAttribute("remember", true);
          }
        }
      }
    }
    return "/customer/login";
  }

  @PostMapping("/login")
  public String processLoginForm(@RequestParam(value = "email", required = false) String email
          , @RequestParam(value = "password", required = false) String password
          , @RequestParam(value = "wp-comment-cookies-consent", defaultValue = "false") Boolean remember
          , HttpSession session
          , HttpServletResponse response
          , HttpServletRequest request
          , RedirectAttributes redirectAttributes) {
    UserDTO user = userService.getUserByEmailAndPassword(email, password);
    if (remember) {
      if (user == null) {
        Cookie uEmailLogin = new Cookie("emailLogin", email);
        uEmailLogin.setMaxAge(8640000);
        Cookie uPasswordLogin = new Cookie("passwordLogin", password);
        uPasswordLogin.setMaxAge(8640000);
        response.addCookie(uEmailLogin);
        response.addCookie(uPasswordLogin);
      } else {
        Cookie uEmailLogin = new Cookie("emailLogin", user.getEmail());
        uEmailLogin.setMaxAge(8640000);
        Cookie uPasswordLogin = new Cookie("passwordLogin", user.getPassword());
        uPasswordLogin.setMaxAge(8640000);
        response.addCookie(uEmailLogin);
        response.addCookie(uPasswordLogin);
      }
    } else {
      Cookie uEmailLogin = new Cookie("emailLogin", "");
      uEmailLogin.setMaxAge(0);
      Cookie uPasswordLogin = new Cookie("passwordLogin", "");
      uPasswordLogin.setMaxAge(0);
      response.addCookie(uEmailLogin);
      response.addCookie(uPasswordLogin);
    }
    if (user == null || !user.getRole().getCode().equals("role_user")) {
      redirectAttributes.addFlashAttribute("ERROR_MESSAGE", "Tài khoản hoặc mật khẩu không chính xác");
      return "redirect:/customer/login";
    }
    CartDTO cartResponse = cartService.findCartByUser(user.getId());
    List<CartDetailDTO> cartDetailsResponse = cartDetailService.findProductInCart(cartResponse.getId());
    session.setAttribute("customerUser", user);
    session.setAttribute("cart", cartResponse);
    session.setAttribute("cartDetail", cartDetailsResponse);
    return "redirect:/customer/home";
  }
}
