package com.baonguyen.springwithjwt.model.response;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class Response<T> {
  private String id;
  private T data;
}
