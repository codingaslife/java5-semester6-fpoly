package com.fpoly.exception;

import com.fpoly.dto.UserDTO;
import jakarta.servlet.http.HttpSession;
import org.springframework.http.HttpStatus;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class RestApiExceptionHandler {

  @ExceptionHandler(RestApiException.class)
  public String handlerException(RestApiException restApiException, Model model, HttpSession session) {
    ApiError apiError = new ApiError(HttpStatus.NOT_FOUND, restApiException.getMessage());
    model.addAttribute("message", apiError.getMessage());
    model.addAttribute("statusCode", apiError.getStatusCode().value());
    model.addAttribute("page", apiError.getStatusCode());
    UserDTO customerUser = (UserDTO) session.getAttribute("customerUser");
    UserDTO adminUser = (UserDTO) session.getAttribute("adminUser");
    model.addAttribute("redirect", "/customer/home");
    if (customerUser != null) {
      model.addAttribute("redirect", "/customer/home");
    }
    if (adminUser != null) {
      model.addAttribute("redirect", "/admin/home");
    }
    return "error";
  }
}
