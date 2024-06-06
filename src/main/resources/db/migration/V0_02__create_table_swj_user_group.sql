DO
$$
    BEGIN
        CREATE TABLE IF NOT EXISTS public."swj_user_group"
        (
            id           BIGSERIAL PRIMARY KEY    NOT NULL,
            swj_user_id  BIGINT                   NOT NULL,
            swj_group_id BIGINT                   NOT NULL,
            created_by   VARCHAR(255)             NOT NULL,
            modified_by  VARCHAR(255)             NOT NULL,
            created      TIMESTAMP WITH TIME ZONE NOT NULL,
            modified     TIMESTAMP WITH TIME ZONE NOT NULL,
            is_deleted   BOOLEAN                  NOT NULL,
            CONSTRAINT "FK_swj_user_id_swj_user_group" FOREIGN KEY (swj_user_id) REFERENCES public."swj_user" (id),
            CONSTRAINT "FK_swj_group_id_swj_user_group" FOREIGN KEY (swj_group_id) REFERENCES public."swj_group" (id)
        );

        COMMENT ON TABLE swj_user_group IS 'user-group relationship table';

        COMMENT ON COLUMN swj_user_group.id IS 'id of user-group relationship';
        COMMENT ON COLUMN swj_user_group.swj_user_id IS 'foreign key referencing user id';
        COMMENT ON COLUMN swj_user_group.swj_group_id IS 'foreign key referencing group id';
        COMMENT ON COLUMN swj_user_group.created_by IS 'the person post data';
        COMMENT ON COLUMN swj_user_group.modified_by IS 'the person modified data';
        COMMENT ON COLUMN swj_user_group.created IS 'time post new data';
        COMMENT ON COLUMN swj_user_group.modified IS 'time modify data';
        COMMENT ON COLUMN swj_user_group.is_deleted IS 'data is deleted or not';
    END
$$