package com.baonguyen.springwithjwt.entity;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "swj_user_group")
@Data
@Builder
@EqualsAndHashCode(callSuper = false)
@AllArgsConstructor
@NoArgsConstructor
public class UserGroupEntity extends BaseEntity{
    @ManyToOne
    @JoinColumn(name = "swj_user_id", referencedColumnName = "id",foreignKey = @ForeignKey(name = "FK_swj_user_id_swj_user_group"))
    private UserEntity userEntity;

    @ManyToOne
    @JoinColumn(name = "swj_group_id", referencedColumnName = "id", foreignKey = @ForeignKey(name = "FK_swj_group_id_swj_user_group"))
    private GroupEntity groupEntity;
}
