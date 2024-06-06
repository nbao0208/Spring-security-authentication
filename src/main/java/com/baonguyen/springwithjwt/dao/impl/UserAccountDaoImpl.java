package com.baonguyen.springwithjwt.dao.impl;

import com.baonguyen.springwithjwt.dao.UserAccountDao;
import com.baonguyen.springwithjwt.entity.UserAccountEntity;
import com.baonguyen.springwithjwt.repository.UserAccountRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class UserAccountDaoImpl implements UserAccountDao {
  private final UserAccountRepository userAccountRepository;

  @Override
  public UserAccountEntity getUserByUserName(String userName) {
    return userAccountRepository.findByAccountName(userName).orElseThrow(() -> new UsernameNotFoundException("User name is incorrect"));
  }
}
