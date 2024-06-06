package com.baonguyen.springwithjwt.dao;

import com.baonguyen.springwithjwt.entity.UserAccountEntity;
import org.springframework.stereotype.Repository;

@Repository
public interface UserAccountDao {
  UserAccountEntity getUserByUserName(String userName);
}
