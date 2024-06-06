package com.baonguyen.springwithjwt.repository;

import com.baonguyen.springwithjwt.entity.UserAccountEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface UserAccountRepository extends JpaRepository<UserAccountEntity,Long> {
  Optional<UserAccountEntity> findByAccountName(String userName);
}
