package com.fpoly.exception;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import org.springframework.http.HttpStatus;

@Getter
@Setter
@AllArgsConstructor
public class RestApiException extends RuntimeException {
  private HttpStatus status;

  public RestApiException(String message) {
    super(message);
  }
}
