package com.fpoly.api;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fpoly.dto.DistrictDTO;
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
public class ApiDistrictClient {

  private Map<String, DistrictDTO> districtMap;

  public ApiDistrictClient() {
    try {
      ObjectMapper objectMapper = new ObjectMapper();
      this.districtMap = objectMapper.readValue(
              new File("src/main/resources/static/quan_huyen.json"),
              new TypeReference<Map<String, DistrictDTO>>() {
              }
      );
    } catch (IOException e) {
      e.printStackTrace();
    }
  }

  @GetMapping("/district")
  public List<DistrictDTO> getLocations() {
    return new ArrayList<>(districtMap.values());
  }
}
