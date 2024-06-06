package com.baonguyen.springwithjwt.entity;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "swj_group")
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(callSuper = false)
public class GroupEntity extends BaseEntity{
    @Column(name = "role")
    private String role;
}
