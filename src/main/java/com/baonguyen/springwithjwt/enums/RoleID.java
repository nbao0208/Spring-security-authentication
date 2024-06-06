package com.baonguyen.springwithjwt.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public enum RoleID {
  ADMIN(1),
  USER(2);
  private final long id;
}
