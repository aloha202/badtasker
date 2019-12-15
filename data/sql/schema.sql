CREATE TABLE board (id BIGINT AUTO_INCREMENT, name VARCHAR(255), PRIMARY KEY(id)) ENGINE = INNODB;
CREATE TABLE board2_user (board_id BIGINT, user_id BIGINT, PRIMARY KEY(board_id, user_id)) ENGINE = INNODB;
CREATE TABLE config (id BIGINT AUTO_INCREMENT, name VARCHAR(255) NOT NULL, title VARCHAR(255), value TEXT, help TEXT, display VARCHAR(255), section VARCHAR(255) DEFAULT 'settings', type VARCHAR(255) DEFAULT 'text', type_enum_values TEXT, use_wysiwyg TINYINT(1) DEFAULT '0', is_localized TINYINT(1) DEFAULT '0', PRIMARY KEY(id)) ENGINE = INNODB;
CREATE TABLE default_image (id BIGINT AUTO_INCREMENT, name VARCHAR(255), title VARCHAR(255), image VARCHAR(255) NOT NULL, PRIMARY KEY(id)) ENGINE = INNODB;
CREATE TABLE punishment_preset (id BIGINT AUTO_INCREMENT, name VARCHAR(255) NOT NULL, PRIMARY KEY(id)) ENGINE = INNODB;
CREATE TABLE task (id BIGINT AUTO_INCREMENT, board_id BIGINT NOT NULL, executer_id BIGINT NOT NULL, responsible_id BIGINT NOT NULL, name VARCHAR(255), description TEXT, deadline DATE, priority VARCHAR(255) DEFAULT 'medium', punishment TEXT, status VARCHAR(255) DEFAULT 'in_progress', comment TEXT, is_failed TINYINT(1) DEFAULT '0', punishment_comment TEXT, is_deadline_changed TINYINT(1), is_deadline_notification_sent TINYINT(1), created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, user_id BIGINT, INDEX board_id_idx (board_id), INDEX executer_id_idx (executer_id), INDEX responsible_id_idx (responsible_id), INDEX user_id_idx (user_id), PRIMARY KEY(id)) ENGINE = INNODB;
CREATE TABLE text_block_translation (id BIGINT, text TEXT, lang CHAR(2), PRIMARY KEY(id, lang)) ENGINE = INNODB;
CREATE TABLE text_block (id BIGINT AUTO_INCREMENT, name VARCHAR(255) NOT NULL, title VARCHAR(255), application VARCHAR(32), module VARCHAR(32), special_mark VARCHAR(32), is_visible_for_admin TINYINT(1) DEFAULT '0', INDEX section_index_idx (application, module), PRIMARY KEY(id)) ENGINE = INNODB;
CREATE TABLE sf_guard_forgot_password (id BIGINT AUTO_INCREMENT, user_id BIGINT NOT NULL, unique_key VARCHAR(255), expires_at DATETIME NOT NULL, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, INDEX user_id_idx (user_id), PRIMARY KEY(id)) ENGINE = INNODB;
CREATE TABLE sf_guard_group (id BIGINT AUTO_INCREMENT, name VARCHAR(255) UNIQUE, description TEXT, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, PRIMARY KEY(id)) ENGINE = INNODB;
CREATE TABLE sf_guard_group_permission (group_id BIGINT, permission_id BIGINT, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, PRIMARY KEY(group_id, permission_id)) ENGINE = INNODB;
CREATE TABLE sf_guard_permission (id BIGINT AUTO_INCREMENT, name VARCHAR(255) UNIQUE, description TEXT, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, PRIMARY KEY(id)) ENGINE = INNODB;
CREATE TABLE sf_guard_remember_key (id BIGINT AUTO_INCREMENT, user_id BIGINT, remember_key VARCHAR(32), ip_address VARCHAR(50), created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, INDEX user_id_idx (user_id), PRIMARY KEY(id)) ENGINE = INNODB;
CREATE TABLE sf_guard_user (id BIGINT AUTO_INCREMENT, first_name VARCHAR(255), last_name VARCHAR(255), email_address VARCHAR(255) NOT NULL UNIQUE, username VARCHAR(128) NOT NULL UNIQUE, algorithm VARCHAR(128) DEFAULT 'sha1' NOT NULL, salt VARCHAR(128), password VARCHAR(128), is_active TINYINT(1) DEFAULT '1', is_super_admin TINYINT(1) DEFAULT '0', last_login DATETIME, lang VARCHAR(255) DEFAULT 'en', created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, INDEX is_active_idx_idx (is_active), PRIMARY KEY(id)) ENGINE = INNODB;
CREATE TABLE sf_guard_user_group (user_id BIGINT, group_id BIGINT, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, PRIMARY KEY(user_id, group_id)) ENGINE = INNODB;
CREATE TABLE sf_guard_user_permission (user_id BIGINT, permission_id BIGINT, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, PRIMARY KEY(user_id, permission_id)) ENGINE = INNODB;
ALTER TABLE board2_user ADD CONSTRAINT board2_user_user_id_sf_guard_user_id FOREIGN KEY (user_id) REFERENCES sf_guard_user(id) ON DELETE CASCADE;
ALTER TABLE board2_user ADD CONSTRAINT board2_user_board_id_board_id FOREIGN KEY (board_id) REFERENCES board(id) ON DELETE CASCADE;
ALTER TABLE task ADD CONSTRAINT task_user_id_sf_guard_user_id FOREIGN KEY (user_id) REFERENCES sf_guard_user(id) ON DELETE CASCADE;
ALTER TABLE task ADD CONSTRAINT task_responsible_id_sf_guard_user_id FOREIGN KEY (responsible_id) REFERENCES sf_guard_user(id) ON DELETE CASCADE;
ALTER TABLE task ADD CONSTRAINT task_executer_id_sf_guard_user_id FOREIGN KEY (executer_id) REFERENCES sf_guard_user(id) ON DELETE CASCADE;
ALTER TABLE task ADD CONSTRAINT task_board_id_board_id FOREIGN KEY (board_id) REFERENCES board(id) ON DELETE CASCADE;
ALTER TABLE text_block_translation ADD CONSTRAINT text_block_translation_id_text_block_id FOREIGN KEY (id) REFERENCES text_block(id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE sf_guard_forgot_password ADD CONSTRAINT sf_guard_forgot_password_user_id_sf_guard_user_id FOREIGN KEY (user_id) REFERENCES sf_guard_user(id) ON DELETE CASCADE;
ALTER TABLE sf_guard_group_permission ADD CONSTRAINT sf_guard_group_permission_permission_id_sf_guard_permission_id FOREIGN KEY (permission_id) REFERENCES sf_guard_permission(id) ON DELETE CASCADE;
ALTER TABLE sf_guard_group_permission ADD CONSTRAINT sf_guard_group_permission_group_id_sf_guard_group_id FOREIGN KEY (group_id) REFERENCES sf_guard_group(id) ON DELETE CASCADE;
ALTER TABLE sf_guard_remember_key ADD CONSTRAINT sf_guard_remember_key_user_id_sf_guard_user_id FOREIGN KEY (user_id) REFERENCES sf_guard_user(id) ON DELETE CASCADE;
ALTER TABLE sf_guard_user_group ADD CONSTRAINT sf_guard_user_group_user_id_sf_guard_user_id FOREIGN KEY (user_id) REFERENCES sf_guard_user(id) ON DELETE CASCADE;
ALTER TABLE sf_guard_user_group ADD CONSTRAINT sf_guard_user_group_group_id_sf_guard_group_id FOREIGN KEY (group_id) REFERENCES sf_guard_group(id) ON DELETE CASCADE;
ALTER TABLE sf_guard_user_permission ADD CONSTRAINT sf_guard_user_permission_user_id_sf_guard_user_id FOREIGN KEY (user_id) REFERENCES sf_guard_user(id) ON DELETE CASCADE;
ALTER TABLE sf_guard_user_permission ADD CONSTRAINT sf_guard_user_permission_permission_id_sf_guard_permission_id FOREIGN KEY (permission_id) REFERENCES sf_guard_permission(id) ON DELETE CASCADE;
