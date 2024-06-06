package com.baonguyen.springwithjwt.controller;

import com.baonguyen.springwithjwt.model.request.AuthenticateRequest;
import com.baonguyen.springwithjwt.model.request.RegisterRequest;
import com.baonguyen.springwithjwt.model.response.AuthenticateResponse;
import com.baonguyen.springwithjwt.model.response.RegisterResponse;
import com.baonguyen.springwithjwt.model.response.Response;
import com.baonguyen.springwithjwt.service.AuthenticationService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;

@RestController
@RequiredArgsConstructor
@RequestMapping(value = "/api/v1/authentication")
@Slf4j
public class AuthenticationController {
  private final AuthenticationService authenticationService;

  @PostMapping(value = "/register", produces = {MediaType.APPLICATION_JSON_VALUE})
  public Response<RegisterResponse> register(@Valid @RequestBody RegisterRequest request) {
    log.info("======>request: {}", request);
    return authenticationService.register(request);
  }

  @GetMapping(value = "/authenticate", produces = {MediaType.APPLICATION_JSON_VALUE})
  public Response<AuthenticateResponse> authenticate(@Valid @RequestBody AuthenticateRequest request) {
    log.info("======>request: {}", request);
    return authenticationService.authenticate(request);
  }
}
