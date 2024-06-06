package com.baonguyen.springwithjwt.model.request;

import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class AuthenticateRequest {
  @NotNull
  private String username;
  @NotNull
  private String password;
}
