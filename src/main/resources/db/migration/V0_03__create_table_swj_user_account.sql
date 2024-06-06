DO
$$
    BEGIN
        CREATE TABLE IF NOT EXISTS public."swj_user_account"
        (
            id                BIGSERIAL PRIMARY KEY    NOT NULL,
            account_name      VARCHAR(255)             NOT NULL,
            password          VARCHAR(255)             NOT NULL,
            swj_user_group_id BIGINT                   NOT NULL,
            created_by        VARCHAR(255)             NOT NULL,
            modified_by       VARCHAR(255)             NOT NULL,
            created           TIMESTAMP WITH TIME ZONE NOT NULL,
            modified          TIMESTAMP WITH TIME ZONE NOT NULL,
            is_deleted        BOOLEAN                  NOT NULL,
            CONSTRAINT "FK_swj_user_group_id_swj_user_account" FOREIGN KEY (swj_user_group_id) REFERENCES swj_user_group (id) ON DELETE CASCADE
        );

        COMMENT ON TABLE swj_user_account IS 'user account table';

        COMMENT ON COLUMN swj_user_account.id IS 'id of user account';
        COMMENT ON COLUMN swj_user_account.account_name IS 'name of the account';
        COMMENT ON COLUMN swj_user_account.password IS 'password of the account';
        COMMENT ON COLUMN swj_user_account.swj_user_group_id IS 'foreign key referencing user-group id';
        COMMENT ON COLUMN swj_user_account.created_by IS 'the person post data';
        COMMENT ON COLUMN swj_user_account.modified_by IS 'the person modified data';
        COMMENT ON COLUMN swj_user_account.created IS 'time post new data';
        COMMENT ON COLUMN swj_user_account.modified IS 'time modify data';
        COMMENT ON COLUMN swj_user_account.is_deleted IS 'data is deleted or not';
    END
$$