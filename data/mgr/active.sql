CREATE TABLE user_settings (id BIGINT AUTO_INCREMENT, user_id BIGINT NOT NULL, show_on_all_websites TINYINT(1) DEFAULT '1', INDEX user_id_idx (user_id), PRIMARY KEY(id)) ENGINE = INNODB;
ALTER TABLE user_settings ADD CONSTRAINT user_settings_user_id_sf_guard_user_id FOREIGN KEY (user_id) REFERENCES sf_guard_user(id) ON DELETE CASCADE;

ALTER TABLE website_project ADD COLUMN has_window TINYINT(1) DEFAULT '1' AFTER codebase_input;
ALTER TABLE website_project ADD COLUMN   is_free TINYINT(1) DEFAULT '0' AFTER has_window;

CREATE TABLE webapp_config (id BIGINT AUTO_INCREMENT, user_id BIGINT NOT NULL, website_project_id BIGINT NOT NULL, config TEXT, is_active TINYINT(1) DEFAULT '1', INDEX user_id_idx (user_id), INDEX website_project_id_idx (website_project_id), PRIMARY KEY(id)) ENGINE = INNODB;
ALTER TABLE webapp_config ADD CONSTRAINT webapp_config_website_project_id_website_project_id FOREIGN KEY (website_project_id) REFERENCES website_project(id) ON DELETE CASCADE;
ALTER TABLE webapp_config ADD CONSTRAINT webapp_config_user_id_sf_guard_user_id FOREIGN KEY (user_id) REFERENCES sf_guard_user(id) ON DELETE CASCADE;