CREATE DATABASE IF NOT EXISTS midas CHARACTER SET utf8mb4 COLLATE utf8mb4_bin;
USE midas;


-- attribute_category
CREATE TABLE IF NOT EXISTS kind_category
(
    kind_category_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY UNIQUE,  
    name VARCHAR(20) NOT NULL UNIQUE,
    description VARCHAR(20) NOT NULL,
    INDEX(name)
) ENGINE=InnoDB DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_bin;

CREATE TABLE IF NOT EXISTS purpose_category
(
    purpose_category_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY UNIQUE,  
    name VARCHAR(20) NOT NULL UNIQUE,
    description VARCHAR(20) NOT NULL,
    INDEX(name)
) ENGINE=InnoDB DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_bin;

CREATE TABLE IF NOT EXISTS place_category
(
    place_category_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY UNIQUE,  
    name VARCHAR(20) NOT NULL UNIQUE,
    description VARCHAR(20) NOT NULL,
    INDEX(name)
) ENGINE=InnoDB DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_bin;

-- attribute_group
CREATE TABLE IF NOT EXISTS kind_group
(
    kind_group_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY UNIQUE,  
    name VARCHAR(20) NOT NULL UNIQUE,
    description VARCHAR(20) NOT NULL,
    INDEX(name)
) ENGINE=InnoDB DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_bin;

CREATE TABLE IF NOT EXISTS purpose_group
(
    purpose_group_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY UNIQUE,  
    name VARCHAR(20) NOT NULL UNIQUE,
    description VARCHAR(20) NOT NULL,
    INDEX(name)
) ENGINE=InnoDB DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_bin;

CREATE TABLE IF NOT EXISTS place_group
(
    place_group_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY UNIQUE,  
    name VARCHAR(20) NOT NULL UNIQUE,
    description VARCHAR(20) NOT NULL,
    INDEX(name)
) ENGINE=InnoDB DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_bin;

-- attribute
CREATE TABLE IF NOT EXISTS kind
(
    kind_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY UNIQUE,  
    name VARCHAR(20) NOT NULL UNIQUE,
    description VARCHAR(20) NOT NULL,
	kind_group_id INT NOT NULL,
    INDEX(name),
    INDEX(kind_group_id),
    FOREIGN KEY (kind_group_id) REFERENCES kind_group(kind_group_id)
) ENGINE=InnoDB DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_bin;

CREATE TABLE IF NOT EXISTS purpose
(
    purpose_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY UNIQUE,  
    name VARCHAR(20) NOT NULL UNIQUE,
    description VARCHAR(20) NOT NULL,
	purpose_group_id INT NOT NULL,
    INDEX(name),
    INDEX(purpose_group_id),
    FOREIGN KEY (purpose_group_id) REFERENCES purpose_group(purpose_group_id)
) ENGINE=InnoDB DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_bin;

CREATE TABLE IF NOT EXISTS place
(
    place_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY UNIQUE,  
    name VARCHAR(20) NOT NULL UNIQUE,
    description VARCHAR(20) NOT NULL,
	place_group_id INT NOT NULL,
    INDEX(name),
    INDEX(place_group_id),
    FOREIGN KEY (place_group_id) REFERENCES place_group(place_group_id)
) ENGINE=InnoDB DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_bin;


-- attribute_category_relation
CREATE TABLE IF NOT EXISTS kind_category_relation
(
    kind_category_id INT NOT NULL,  
    kind_id INT NOT NULL,  
    INDEX(kind_category_id, kind_id),
    INDEX(kind_id, kind_category_id),
    PRIMARY KEY(kind_category_id, kind_id),
    FOREIGN KEY (kind_category_id) REFERENCES kind_category(kind_category_id),
    FOREIGN KEY (kind_id) REFERENCES kind(kind_id)
) ENGINE=InnoDB DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_bin;

CREATE TABLE IF NOT EXISTS purpose_category_relation
(
    purpose_category_id INT NOT NULL,  
    purpose_id INT NOT NULL,  
    INDEX(purpose_category_id, purpose_id),
    INDEX(purpose_id, purpose_category_id),
    PRIMARY KEY(purpose_category_id, purpose_id),
    FOREIGN KEY (purpose_category_id) REFERENCES purpose_category(purpose_category_id),
    FOREIGN KEY (purpose_id) REFERENCES purpose(purpose_id)
) ENGINE=InnoDB DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_bin;

CREATE TABLE IF NOT EXISTS place_category_relation
(
    place_category_id INT NOT NULL,  
    place_id INT NOT NULL,  
    INDEX(place_category_id, place_id),
    INDEX(place_id, place_category_id),
    PRIMARY KEY(place_category_id, place_id),
    FOREIGN KEY (place_category_id) REFERENCES place_category(place_category_id),
    FOREIGN KEY (place_id) REFERENCES place(place_id)
) ENGINE=InnoDB DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_bin;

-- balance
CREATE TABLE IF NOT EXISTS balance
(
    balance_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY UNIQUE,  
    amount INT NOT NULL,
    item VARCHAR(50) NOT NULL,
    kind_id INT NOT NULL,
    purpose_id INT NOT NULL,
    place_id INT NOT NULL,
    date DATE NOT NULL,
    INDEX(kind_id),
    INDEX(purpose_id),
    INDEX(place_id),
    INDEX(date),
    FOREIGN KEY (kind_id) REFERENCES kind(kind_id),
    FOREIGN KEY (purpose_id) REFERENCES purpose(purpose_id),
    FOREIGN KEY (place_id) REFERENCES place(place_id)
) ENGINE=InnoDB DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_bin;
