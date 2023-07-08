package com.fpoly.repository;

import com.fpoly.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface UserRepository extends JpaRepository<User, UUID> {

  @Query("select u from User u left join fetch u.role")
  List<User> getAll();

  @Query(nativeQuery = true, value = "SELECT MAX(TRY_CAST(SUBSTRING(code, 5, LEN(code) - 4) AS INT)) + 1\n" +
          "FROM __user")
  String userCodePrefixGenerateSQL();

  @Query("select u from User u left join fetch u.role where u.email = ?1 and u.password = ?2")
  User findUserByEmailAndPassword(String email, String password);

}
