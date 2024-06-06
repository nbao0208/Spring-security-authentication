package com.baonguyen.springwithjwt.model.response;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class AuthenticateResponse {
  private boolean success;
  private String token;
}
