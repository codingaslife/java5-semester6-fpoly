package com.fpoly.service;

import com.fpoly.dto.UserDTO;

import java.util.List;

public interface UserService {

  List<UserDTO> getAll();

  UserDTO getUserByEmailAndPassword(String username, String password);

  UserDTO registerCustomerUser(UserDTO userDTO);

  String prefixCode();
}
