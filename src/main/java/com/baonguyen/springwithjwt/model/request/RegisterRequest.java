package com.baonguyen.springwithjwt.model.request;

import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class RegisterRequest {
  @NotNull
  private String userName;
  @NotNull
  private String password;
  @NotNull
  private String name;
  @NotNull
  private String email;
  @NotNull
  private String dob;
  @NotNull
  private String phoneNumber;
}
