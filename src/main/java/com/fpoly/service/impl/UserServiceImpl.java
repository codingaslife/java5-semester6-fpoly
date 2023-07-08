package com.fpoly.service.impl;

import com.fpoly.dto.UserDTO;
import com.fpoly.entity.User;
import com.fpoly.repository.CartRepository;
import com.fpoly.repository.RoleRepository;
import com.fpoly.repository.UserRepository;
import com.fpoly.service.UserService;
import com.fpoly.utils.ObjectPrefixCode;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class UserServiceImpl implements UserService {

  @Autowired
  private UserRepository userRepository;

  @Autowired
  private RoleRepository roleRepository;

  @Autowired
  private ModelMapper modelMapper;

  @Autowired
  private CartRepository cartRepository;

  @Override
  public List<UserDTO> getAll() {
    return userRepository.getAll().stream().map(u -> modelMapper.map(u, UserDTO.class)).collect(Collectors.toList());
  }

  @Override
  public UserDTO getUserByEmailAndPassword(String email, String password) {
    User user = userRepository.findUserByEmailAndPassword(email, password);
    if (user != null) {
      UserDTO userResponse = modelMapper.map(user, UserDTO.class);
      return userResponse;
    }
    return null;
  }

  @Override
  public UserDTO registerCustomerUser(UserDTO userDTO) {
    User user = modelMapper.map(userDTO, User.class);
    user.setCode(prefixCode());
    user.setRole(roleRepository.findRoleByCode("role_user"));
    userRepository.save(user);
    UserDTO userResponse = getUserByEmailAndPassword(user.getEmail(), user.getPassword());
    return userResponse;
  }

  @Override
  public String prefixCode() {
    return userRepository.findAll().isEmpty() ? ObjectPrefixCode.USER_CODE + 1 : ObjectPrefixCode.USER_CODE + userRepository.userCodePrefixGenerateSQL();
  }
}
