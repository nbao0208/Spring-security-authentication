package com.baonguyen.springwithjwt.repository;

import com.baonguyen.springwithjwt.entity.GroupEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface GroupRepository extends JpaRepository<GroupEntity,Long> {
}
