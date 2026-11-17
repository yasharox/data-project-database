-- ============================================
-- 2. CLEANUP DATABASE AND USER
-- ============================================

-- Delete the IPL database and all its tables.
DROP DATABASE IF EXISTS IPL;

-- Delete the MySQL user.
DROP USER IF EXISTS 'ipl_user'@'localhost';
