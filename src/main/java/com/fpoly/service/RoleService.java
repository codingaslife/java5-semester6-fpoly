package com.fpoly.service;

import com.fpoly.entity.Role;
import org.springframework.data.jpa.repository.EntityGraph;

import java.util.List;

public interface RoleService {

  List<Role> findAll();
}
