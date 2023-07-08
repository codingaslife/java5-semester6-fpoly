package com.fpoly.api;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fpoly.dto.CityDTO;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api")
public class ApiCityClient {

  private Map<String, CityDTO> cityMap;

  public ApiCityClient() {
    try {
      ObjectMapper objectMapper = new ObjectMapper();
      this.cityMap = objectMapper.readValue(
              new File("src/main/resources/static/tinh_tp.json"),
              new TypeReference<Map<String, CityDTO>>() {
              }
      );
    } catch (IOException e) {
      e.printStackTrace();
    }
  }

  @GetMapping("/citys")
  public List<CityDTO> getLocations() {
    return new ArrayList<>(cityMap.values());
  }
}
