DO
$$
    BEGIN
        CREATE TABLE IF NOT EXISTS public."swj_group"
        (
            id          BIGSERIAL PRIMARY KEY    NOT NULL,
            role        VARCHAR(25)              NOT NULL,
            created_by  VARCHAR(255)             NOT NULL,
            modified_by VARCHAR(255)             NOT NULL,
            created     TIMESTAMP WITH TIME ZONE NOT NULL,
            modified    TIMESTAMP WITH TIME ZONE NOT NULL,
            is_deleted  BOOLEAN                  NOT NULL
        );

        COMMENT ON TABLE swj_group IS 'group table';

        COMMENT ON COLUMN swj_group.id IS 'id of group and this is unique';
        COMMENT ON COLUMN swj_group.role IS 'the role of the group';
        COMMENT ON COLUMN swj_group.created_by IS 'the person post data';
        COMMENT ON COLUMN swj_group.modified_by IS 'the person modified data';
        COMMENT ON COLUMN swj_group.created IS 'time post new data';
        COMMENT ON COLUMN swj_group.modified IS 'time modify data';
        COMMENT ON COLUMN swj_group.is_deleted IS 'data is deleted or not';
    END
$$