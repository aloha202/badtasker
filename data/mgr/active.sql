ALTER TABLE task ADD COLUMN is_failed TINYINT(1) DEFAULT '0' AFTER comment;
ALTER TABLE task ADD COLUMN punishment_comment TEXT AFTER is_failed;