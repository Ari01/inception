CREATE DATABASE IF NOT EXISTS wp;
CREATE USER IF NOT EXISTS 'root'@'%' IDENTIFIED BY 'user42';
GRANT ALL PRIVILEGES ON wp.* TO 'root'@'%';
FLUSH PRIVILEGES;
