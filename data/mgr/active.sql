ALTER TABLE task ADD COLUMN priority VARCHAR(255) DEFAULT 'medium' AFTER deadline;