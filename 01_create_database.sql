-- ============================================
-- 1. CREATE DATABASE AND USER
-- ============================================

-- Create a new MySQL user.
CREATE USER IF NOT EXISTS
'ipl_user'@'localhost'
IDENTIFIED BY 'PASSWORD';

-- Create the IPL database.
CREATE DATABASE IF NOT EXISTS IPL;

-- Grant all privileges on the IPL database
-- to the newly created user.
GRANT ALL PRIVILEGES ON IPL.*
TO 'ipl_user'@'localhost';

-- Display the granted privileges.
SHOW GRANTS FOR 'ipl_user'@'localhost';

-- Select the IPL database for executing queries.
USE IPL;

-- Display all tables available in the IPL database.
SHOW TABLES;
