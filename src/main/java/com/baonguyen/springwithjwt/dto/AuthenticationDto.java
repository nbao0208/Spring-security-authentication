package com.baonguyen.springwithjwt.dto;

import com.baonguyen.springwithjwt.model.request.AuthenticateRequest;
import com.baonguyen.springwithjwt.model.request.RegisterRequest;
import com.baonguyen.springwithjwt.model.response.AuthenticateResponse;
import com.baonguyen.springwithjwt.model.response.RegisterResponse;
import org.springframework.stereotype.Repository;

@Repository
public interface AuthenticationDto {
  RegisterResponse register(RegisterRequest request);

  AuthenticateResponse authenticate(AuthenticateRequest request);
}
