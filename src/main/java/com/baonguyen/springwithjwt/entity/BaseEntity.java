package com.baonguyen.springwithjwt.entity;

import com.baonguyen.springwithjwt.constant.PersonHandleDatabase;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.OffsetDateTime;

@MappedSuperclass
@Data
@AllArgsConstructor
@NoArgsConstructor
public abstract class BaseEntity {
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "created_by")
    private String createdBy = PersonHandleDatabase.HANDEL_PERSON;

    @Column(name = "modified_by")
    private String modifiedBy = PersonHandleDatabase.HANDEL_PERSON;

    @Column(name = "created")
    private OffsetDateTime created;

    @Column(name = "modified")
    private OffsetDateTime modified;

    @Column(name = "is_deleted")
    private boolean isDeleted = false;

    @PrePersist
    protected void onCreate() {
        this.created = OffsetDateTime.now();
        this.modified = OffsetDateTime.now();
    }

    @PreUpdate
    protected void onUpdate() {
        this.modified = OffsetDateTime.now();
    }
}
