package com.fpoly.service.impl;

import com.fpoly.entity.Role;
import com.fpoly.repository.RoleRepository;
import com.fpoly.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RoleServiceImpl implements RoleService {

  @Autowired
  private RoleRepository roleRepository;

  @Override
  @EntityGraph(attributePaths = {"users"})
  public List<Role> findAll() {
    return roleRepository.findAll();
  }
}
