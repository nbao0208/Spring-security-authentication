package com.baonguyen.springwithjwt.service.impl;

import com.baonguyen.springwithjwt.dto.AuthenticationDto;
import com.baonguyen.springwithjwt.model.request.AuthenticateRequest;
import com.baonguyen.springwithjwt.model.request.RegisterRequest;
import com.baonguyen.springwithjwt.model.response.AuthenticateResponse;
import com.baonguyen.springwithjwt.model.response.RegisterResponse;
import com.baonguyen.springwithjwt.model.response.Response;
import com.baonguyen.springwithjwt.service.AuthenticationService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.UUID;

@Service
@RequiredArgsConstructor
public class AuthenticationServiceImpl implements AuthenticationService {
  private final AuthenticationDto authenticationDto;

  @Override
  public Response<RegisterResponse> register(RegisterRequest registerRequest) {
    return Response.<RegisterResponse>builder()
            .id(UUID.randomUUID().toString())
            .data(authenticationDto.register(registerRequest))
            .build();
  }

  @Override
  public Response<AuthenticateResponse> authenticate(AuthenticateRequest request) {
    return Response.<AuthenticateResponse>builder()
            .id(UUID.randomUUID().toString())
            .data(authenticationDto.authenticate(request))
            .build();
  }
}
