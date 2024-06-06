package com.baonguyen.springwithjwt.dao;

import com.baonguyen.springwithjwt.entity.UserAccountEntity;
import com.baonguyen.springwithjwt.model.response.RegisterResponse;
import org.springframework.stereotype.Repository;

@Repository
public interface AuthenticationDao {
  UserAccountEntity register(String userName, String password, String name, String email, String dob, String phoneNumber);

  UserAccountEntity authenticate(String userName, String password);
}
