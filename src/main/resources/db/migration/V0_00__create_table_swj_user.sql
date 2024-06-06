DO
$$
    BEGIN
        CREATE TABLE IF NOT EXISTS public."swj_user"
        (
            id          BIGSERIAL PRIMARY KEY    NOT NULL,
            name        TEXT                     NOT NULL,
            email       TEXT                     NOT NULL,
            dob         DATE                     NOT NULL,
            phone_number VARCHAR(10)             NOT NULL,
            created_by  VARCHAR(255)             NOT NULL,
            modified_by VARCHAR(255)             NOT NULL,
            created     TIMESTAMP WITH TIME ZONE NOT NULL,
            modified    TIMESTAMP WITH TIME ZONE NOT NULL,
            is_deleted  BOOLEAN                  NOT NULL
        );

        COMMENT ON TABLE swj_user IS 'user table';

        COMMENT ON COLUMN swj_user.id IS 'id of user and this is unique';
        COMMENT ON COLUMN swj_user.name IS 'the name of user';
        COMMENT ON COLUMN swj_user.email IS 'the email of user';
        COMMENT ON COLUMN swj_user.dob IS 'date of birth of user';
        COMMENT ON COLUMN swj_user.created_by IS 'the person post data';
        COMMENT ON COLUMN swj_user.modified_by IS 'the person modified data';
        COMMENT ON COLUMN swj_user.created IS 'time post new data';
        COMMENT ON COLUMN swj_user.modified IS 'time modify data';
        COMMENT ON COLUMN swj_user.is_deleted IS 'data is deleted or not';
    END
$$