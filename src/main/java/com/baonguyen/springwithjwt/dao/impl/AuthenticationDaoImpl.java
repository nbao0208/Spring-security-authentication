package com.baonguyen.springwithjwt.dao.impl;

import com.baonguyen.springwithjwt.dao.AuthenticationDao;
import com.baonguyen.springwithjwt.entity.GroupEntity;
import com.baonguyen.springwithjwt.entity.UserAccountEntity;
import com.baonguyen.springwithjwt.entity.UserEntity;
import com.baonguyen.springwithjwt.entity.UserGroupEntity;
import com.baonguyen.springwithjwt.enums.RoleID;
import com.baonguyen.springwithjwt.repository.GroupRepository;
import com.baonguyen.springwithjwt.repository.UserAccountRepository;
import com.baonguyen.springwithjwt.repository.UserGroupRepository;
import com.baonguyen.springwithjwt.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.time.LocalDate;

@Service
@RequiredArgsConstructor
public class AuthenticationDaoImpl implements AuthenticationDao {
  private final UserAccountRepository userAccountRepository;
  private final UserRepository userRepository;
  private final UserGroupRepository userGroupRepository;
  private final GroupRepository groupRepository;
  private final AuthenticationManager authenticationManager;

  @Override
  public UserAccountEntity register(String userName, String password, String name, String email, String dob, String phoneNumber) {
    UserEntity userEntity = this.generateUserEntity(name, email, dob, phoneNumber);
    userRepository.save(userEntity);
    UserGroupEntity userGroupEntity = this.generateUserGroupEntity(userEntity);
    userGroupRepository.save(userGroupEntity);
    UserAccountEntity userAccountEntity = this.generateUserAccountEntity(userGroupEntity, userName, password);
    userAccountRepository.save(userAccountEntity);
    return userAccountEntity;
  }

  @Override
  public UserAccountEntity authenticate(String userName, String password) {
    authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(userName, password));
    return this.finaUserAccountByUsername(userName);
  }

  private UserEntity generateUserEntity(String name, String email, String dob, String phoneNumber) {
    return UserEntity.builder()
            .name(name)
            .email(email)
            .dob(LocalDate.parse(dob))
            .phoneNumber(phoneNumber)
            .build();
  }

  private UserGroupEntity generateUserGroupEntity(UserEntity userEntity) {
    GroupEntity groupEntity = groupRepository.findById(RoleID.USER.getId()).orElseThrow(() -> new IllegalArgumentException("404 not found group"));
    return UserGroupEntity.builder()
            .groupEntity(groupEntity)
            .userEntity(userEntity)
            .build();
  }

  private String encodePassword(String password) {
    return (new BCryptPasswordEncoder()).encode(password);
  }

  private UserAccountEntity generateUserAccountEntity(UserGroupEntity userGroupEntity, String userName, String password) {
    return UserAccountEntity.builder()
            .accountName(userName)
            .password(this.encodePassword(password))
            .userGroupEntity(userGroupEntity)
            .build();
  }

  private UserAccountEntity finaUserAccountByUsername(String userName) {
    return userAccountRepository.findByAccountName(userName).orElseThrow(() -> new IllegalArgumentException("404 not found user account"));
  }

  private boolean isPasswordValid(String password, String confirmPassword) {
    return password.equals(confirmPassword);
  }
}
