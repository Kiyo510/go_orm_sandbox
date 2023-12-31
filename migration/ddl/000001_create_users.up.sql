BEGIN;
CREATE TABLE IF NOT EXISTS users(
                                    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
                                    name VARCHAR(255) NOT NULL,
    age INT NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at DATETIME DEFAULT NULL,
    PRIMARY KEY(id)
    );
CREATE INDEX age_index ON users (age);
COMMIT;
