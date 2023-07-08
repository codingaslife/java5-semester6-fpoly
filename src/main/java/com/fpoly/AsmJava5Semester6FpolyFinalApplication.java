package com.fpoly;

import org.modelmapper.ModelMapper;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

@SpringBootApplication
public class AsmJava5Semester6FpolyFinalApplication {

  @Bean
  public ModelMapper modelMapper() {
    return new ModelMapper();
  }

  public static void main(String[] args) {
    SpringApplication.run(AsmJava5Semester6FpolyFinalApplication.class, args);
  }

}
