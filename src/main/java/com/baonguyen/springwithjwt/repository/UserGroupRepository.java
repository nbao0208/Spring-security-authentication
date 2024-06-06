package com.baonguyen.springwithjwt.repository;

import com.baonguyen.springwithjwt.entity.UserGroupEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserGroupRepository extends JpaRepository<UserGroupEntity,Long> {
}
