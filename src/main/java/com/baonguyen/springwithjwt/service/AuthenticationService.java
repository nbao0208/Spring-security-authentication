package com.baonguyen.springwithjwt.service;

import com.baonguyen.springwithjwt.model.request.AuthenticateRequest;
import com.baonguyen.springwithjwt.model.request.RegisterRequest;
import com.baonguyen.springwithjwt.model.response.AuthenticateResponse;
import com.baonguyen.springwithjwt.model.response.RegisterResponse;
import com.baonguyen.springwithjwt.model.response.Response;
import org.springframework.stereotype.Repository;

@Repository
public interface AuthenticationService {
  Response<RegisterResponse> register(RegisterRequest registerRequest);

  Response<AuthenticateResponse> authenticate(AuthenticateRequest request);
}
