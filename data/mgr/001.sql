CREATE TABLE site_visit (id BIGINT AUTO_INCREMENT, ip_address VARCHAR(32), country VARCHAR(32), user_agent VARCHAR(255), created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, PRIMARY KEY(id)) ENGINE = INNODB;
CREATE TABLE site_visit_page (id BIGINT AUTO_INCREMENT, site_visit_id BIGINT NOT NULL, url VARCHAR(255), created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, INDEX site_visit_id_idx (site_visit_id), PRIMARY KEY(id)) ENGINE = INNODB;
ALTER TABLE site_visit_page ADD CONSTRAINT site_visit_page_site_visit_id_site_visit_id FOREIGN KEY (site_visit_id) REFERENCES site_visit(id) ON DELETE CASCADE;


-----------------
CREATE TABLE usages (id BIGINT AUTO_INCREMENT, description TEXT NOT NULL, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, user_id BIGINT, INDEX user_id_idx (user_id), PRIMARY KEY(id)) ENGINE = INNODB;
ALTER TABLE usages ADD CONSTRAINT usages_user_id_sf_guard_user_id FOREIGN KEY (user_id) REFERENCES sf_guard_user(id) ON DELETE CASCADE;


ALTER TABLE menu_item ADD COLUMN is_auth TINYINT(1) DEFAULT '0' AFTER is_empty;

ALTER TABLE `profile`  DROP COLUMN `last_name`,  DROP COLUMN `first_name`,  DROP COLUMN `middle_name`;
ALTER TABLE `profile` ADD COLUMN name VARCHAR(255) AFTER sex;

----------------------
ALTER TABLE site_visit ADD COLUMN user_id BIGINT AFTER user_agent;
ALTER TABLE site_visit ADD INDEX user_id_idx (user_id);
ALTER TABLE site_visit ADD CONSTRAINT site_visit_user_id_sf_guard_user_id FOREIGN KEY (user_id) REFERENCES sf_guard_user(id) ON DELETE SET NULL;