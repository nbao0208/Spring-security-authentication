package com.baonguyen.springwithjwt.dto.impl;

import com.baonguyen.springwithjwt.dao.AuthenticationDao;
import com.baonguyen.springwithjwt.dto.AuthenticationDto;
import com.baonguyen.springwithjwt.model.request.AuthenticateRequest;
import com.baonguyen.springwithjwt.model.request.RegisterRequest;
import com.baonguyen.springwithjwt.model.response.AuthenticateResponse;
import com.baonguyen.springwithjwt.model.response.RegisterResponse;
import com.baonguyen.springwithjwt.service.JwtService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class AuthenticationDtoImpl implements AuthenticationDto {
  private final AuthenticationDao authenticationDao;
  private final JwtService jwtService;

  @Override
  public RegisterResponse register(RegisterRequest request) {
    return RegisterResponse.builder()
            .success(true)
            .token(jwtService.generateToken(authenticationDao.register(request.getUserName()
                    , request.getPassword()
                    , request.getName()
                    , request.getEmail()
                    , request.getDob()
                    , request.getPhoneNumber())))
            .build();
  }

  @Override
  public AuthenticateResponse authenticate(AuthenticateRequest request) {
    return AuthenticateResponse.builder()
            .success(true)
            .token(jwtService.generateToken(authenticationDao.authenticate(request.getUsername()
                    , request.getPassword())))
            .build();
  }
}
