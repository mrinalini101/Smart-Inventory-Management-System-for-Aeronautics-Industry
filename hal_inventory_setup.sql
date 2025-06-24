-- ============================================================================
-- 1. Create & select the database
-- ============================================================================
CREATE DATABASE IF NOT EXISTS hal_inventory
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;
USE hal_inventory;

-- ============================================================================
-- 2. Lookup & Reference Tables
-- ============================================================================

-- 2.1 Material Categories
CREATE TABLE material_categories (
  category_id    INT AUTO_INCREMENT PRIMARY KEY,
  name           VARCHAR(50)   NOT NULL UNIQUE,
  description    VARCHAR(255)
) ENGINE=InnoDB;

-- 2.2 Inventory Item Types
CREATE TABLE inventory_… 

USE hal_inventory;

-- 1.1: Enhance users table for email verification
ALTER TABLE users
  ADD COLUMN email_verified   BOOLEAN       NOT NULL DEFAULT FALSE,
  ADD COLUMN verify_token     VARCHAR(255)  NULL,
  ADD COLUMN token_generated  DATETIME      NULL,
  ADD COLUMN token_expires    DATETIME      NULL;

-- 1.2: Login history table for audit/IP tracking
CREATE TABLE login_history (
  log_id       BIGINT AUTO_INCREMENT PRIMARY KEY,
  user_id      INT            NOT NULL,
  login_time   DATETIME       NOT NULL DEFAULT CURRENT_TIMESTAMP,
  ip_address   VARCHAR(45)    NOT NULL,
  user_agent   TEXT,
  FOREIGN KEY (user_id) REFERENCES users(user_id)
    ON DELETE CASCADE ON UPDATE CASCADE,
  INDEX idx_lh_user_time (user_id, login_time),
  INDEX idx_lh_ip        (ip_address)
) ENGINE=InnoDB;

ALTER TABLE items
  DROP FOREIGN KEY items_ibfk_4;

ALTER TABLE uom
  MODIFY COLUMN uom_id INT NOT NULL AUTO_INCREMENT;

ALTER TABLE items
  MODIFY COLUMN uom_id INT NOT NULL;

ALTER TABLE items
  ADD CONSTRAINT items_ibfk_4
    FOREIGN KEY (uom_id)
    REFERENCES uom(uom_id)
    ON UPDATE CASCADE
    ON DELETE RESTRICT;

ALTER TABLE orders
  ADD COLUMN supplier_id INT   NULL,
  ADD COLUMN currency    VARCHAR(10) NOT NULL DEFAULT 'INR';

-- back-fill existing rows; pick a valid supplier_id in your table:
UPDATE orders
   SET supplier_id = 1
 WHERE supplier_id IS NULL;

ALTER TABLE orders
  MODIFY COLUMN supplier_id INT NOT NULL,
  ADD CONSTRAINT fk_orders_supplier
    FOREIGN KEY (supplier_id)
    REFERENCES suppliers(supplier_id);

-- turn off safe‐updates
SET SQL_SAFE_UPDATES = 0;

-- now run your backfill
UPDATE orders
   SET supplier_id = 1
 WHERE supplier_id IS NULL;

-- (re)enable safe‐updates if you like
SET SQL_SAFE_UPDATES = 1;

ALTER TABLE orders
  ADD COLUMN value DECIMAL(14,2) NOT NULL DEFAULT 0.00;

USE hal_inventory;

INSERT INTO users
  (emp_id, first_name, last_name, email, password_hash, role, email_verified, is_active)
VALUES
  (
    'ADMIN001',
    'Super',
    'Admin',
    'admin@koraput.hal.in',
    'scrypt:32768:8:1$vHows6YElRk1BZUN$23eced9314a20b2aed0f27d3caf23db90f019e5c8572923c93044b715dcc02f20d4b08f3202d294858d2b31ea1e2389076161c2e55f59754f53e246dc6c28c99',
    'admin',
    TRUE,
    TRUE
  );
