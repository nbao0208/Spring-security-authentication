package com.baonguyen.springwithjwt.entity;

import jakarta.persistence.*;
import lombok.*;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.Collection;
import java.util.List;

@Entity
@Table(name = "swj_user_account")
@Data
@Builder
@EqualsAndHashCode(callSuper = false)
@AllArgsConstructor
@NoArgsConstructor
public class UserAccountEntity extends BaseEntity implements UserDetails {
  @Column(name = "account_name")
  private String accountName;

  @Column(name = "password")
  private String password;

  @ManyToOne
  @JoinColumn(name = "swj_user_group_id", referencedColumnName = "id", foreignKey = @ForeignKey(name = "FK_swj_user_group_id_swj_user_account"))
  private UserGroupEntity userGroupEntity;

  @Override
  public Collection<? extends GrantedAuthority> getAuthorities() {
    return List.of(new SimpleGrantedAuthority(this.userGroupEntity.getGroupEntity().getRole()));
  }

  @Override
  public String getUsername() {
    return this.accountName;
  }

  @Override
  public boolean isAccountNonExpired() {
    return true;
  }

  @Override
  public boolean isAccountNonLocked() {
    return true;
  }

  @Override
  public boolean isCredentialsNonExpired() {
    return true;
  }

  @Override
  public boolean isEnabled() {
    return true;
  }
}
