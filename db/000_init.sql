CREATE DATABASE IF NOT EXISTS midas CHARACTER SET utf8mb4 COLLATE utf8mb4_bin;
USE midas;

CREATE TABLE IF NOT EXISTS kind
(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY UNIQUE,  
    name VARCHAR(20) NOT NULL,
    description VARCHAR(20) NOT NULL,
    INDEX(name)
) ENGINE=InnoDB DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_bin;

CREATE TABLE IF NOT EXISTS purpose
(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY UNIQUE,  
    name VARCHAR(20) NOT NULL,
    description VARCHAR(20) NOT NULL,
    INDEX(name)
) ENGINE=InnoDB DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_bin;

CREATE TABLE IF NOT EXISTS place
(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY UNIQUE,  
    name VARCHAR(20) NOT NULL,
    description VARCHAR(20) NOT NULL,
    INDEX(name)
) ENGINE=InnoDB DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_bin;

CREATE TABLE IF NOT EXISTS kind_group
(
    group_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY UNIQUE,  
    name VARCHAR(20) NOT NULL,
    description VARCHAR(20) NOT NULL,
    INDEX(name)
) ENGINE=InnoDB DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_bin;

CREATE TABLE IF NOT EXISTS purpose_group
(
    group_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY UNIQUE,  
    name VARCHAR(20) NOT NULL,
    description VARCHAR(20) NOT NULL,
    INDEX(name)
) ENGINE=InnoDB DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_bin;

CREATE TABLE IF NOT EXISTS place_group
(
    group_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY UNIQUE,  
    name VARCHAR(20) NOT NULL,
    description VARCHAR(20) NOT NULL,
    INDEX(name)
) ENGINE=InnoDB DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_bin;

CREATE TABLE IF NOT EXISTS balance
(
    balance_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY UNIQUE,  
    amount INT NOT NULL,
    item VARCHAR(20) NOT NULL,
    kind_id INT NOT NULL,
    purpose_id INT NOT NULL,
    place_id INT NOT NULL,
    date DATE NOT NULL,
    INDEX(kind_id),
    INDEX(purpose_id),
    INDEX(place_id),
    INDEX(date)
) ENGINE=InnoDB DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_bin;
