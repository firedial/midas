CREATE DATABASE IF NOT EXISTS midas CHARACTER SET utf8mb4 COLLATE utf8mb4_bin;
USE midas;


-- m_attribute_category
CREATE TABLE IF NOT EXISTS m_kind_category
(
    kind_category_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY UNIQUE,  
    kind_category_name VARCHAR(20) NOT NULL UNIQUE,
    kind_category_description VARCHAR(20) NOT NULL,
    INDEX(kind_category_name)
) ENGINE=InnoDB DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_bin;

CREATE TABLE IF NOT EXISTS m_purpose_category
(
    purpose_category_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY UNIQUE,  
    purpose_category_name VARCHAR(20) NOT NULL UNIQUE,
    purpose_category_description VARCHAR(20) NOT NULL,
    INDEX(purpose_category_name)
) ENGINE=InnoDB DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_bin;

CREATE TABLE IF NOT EXISTS m_place_category
(
    place_category_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY UNIQUE,  
    place_category_name VARCHAR(20) NOT NULL UNIQUE,
    place_category_description VARCHAR(20) NOT NULL,
    INDEX(place_category_name)
) ENGINE=InnoDB DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_bin;

-- m_attribute_group
CREATE TABLE IF NOT EXISTS m_kind_group
(
    kind_group_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY UNIQUE,  
    kind_group_name VARCHAR(20) NOT NULL UNIQUE,
    kind_group_description VARCHAR(20) NOT NULL,
    INDEX(kind_group_name)
) ENGINE=InnoDB DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_bin;

CREATE TABLE IF NOT EXISTS m_purpose_group
(
    purpose_group_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY UNIQUE,  
    purpose_group_name VARCHAR(20) NOT NULL UNIQUE,
    purpose_group_description VARCHAR(20) NOT NULL,
    INDEX(purpose_group_name)
) ENGINE=InnoDB DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_bin;

CREATE TABLE IF NOT EXISTS m_place_group
(
    place_group_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY UNIQUE,  
    place_group_name VARCHAR(20) NOT NULL UNIQUE,
    place_group_description VARCHAR(20) NOT NULL,
    INDEX(place_group_name)
) ENGINE=InnoDB DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_bin;

-- m_attribute
CREATE TABLE IF NOT EXISTS m_kind
(
    kind_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY UNIQUE,  
    kind_name VARCHAR(20) NOT NULL UNIQUE,
    kind_description VARCHAR(20) NOT NULL,
	kind_group_id INT NOT NULL,
    INDEX(kind_name),
    INDEX(kind_group_id),
    FOREIGN KEY (kind_group_id) REFERENCES m_kind_group(kind_group_id)
) ENGINE=InnoDB DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_bin;

CREATE TABLE IF NOT EXISTS m_purpose
(
    purpose_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY UNIQUE,  
    purpose_name VARCHAR(20) NOT NULL UNIQUE,
    purpose_description VARCHAR(20) NOT NULL,
	purpose_group_id INT NOT NULL,
    INDEX(purpose_name),
    INDEX(purpose_group_id),
    FOREIGN KEY (purpose_group_id) REFERENCES m_purpose_group(purpose_group_id)
) ENGINE=InnoDB DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_bin;

CREATE TABLE IF NOT EXISTS m_place
(
    place_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY UNIQUE,  
    place_name VARCHAR(20) NOT NULL UNIQUE,
    place_description VARCHAR(20) NOT NULL,
	place_group_id INT NOT NULL,
    INDEX(place_name),
    INDEX(place_group_id),
    FOREIGN KEY (place_group_id) REFERENCES m_place_group(place_group_id)
) ENGINE=InnoDB DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_bin;


-- m_attribute_category_relation
CREATE TABLE IF NOT EXISTS m_kind_category_relation
(
    kind_category_id INT NOT NULL,  
    kind_id INT NOT NULL,  
    INDEX(kind_category_id, kind_id),
    INDEX(kind_id, kind_category_id),
    PRIMARY KEY(kind_category_id, kind_id),
    FOREIGN KEY (kind_category_id) REFERENCES m_kind_category(kind_category_id),
    FOREIGN KEY (kind_id) REFERENCES m_kind(kind_id)
) ENGINE=InnoDB DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_bin;

CREATE TABLE IF NOT EXISTS m_purpose_category_relation
(
    purpose_category_id INT NOT NULL,  
    purpose_id INT NOT NULL,  
    INDEX(purpose_category_id, purpose_id),
    INDEX(purpose_id, purpose_category_id),
    PRIMARY KEY(purpose_category_id, purpose_id),
    FOREIGN KEY (purpose_category_id) REFERENCES m_purpose_category(purpose_category_id),
    FOREIGN KEY (purpose_id) REFERENCES m_purpose(purpose_id)
) ENGINE=InnoDB DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_bin;

CREATE TABLE IF NOT EXISTS m_place_category_relation
(
    place_category_id INT NOT NULL,  
    place_id INT NOT NULL,  
    INDEX(place_category_id, place_id),
    INDEX(place_id, place_category_id),
    PRIMARY KEY(place_category_id, place_id),
    FOREIGN KEY (place_category_id) REFERENCES m_place_category(place_category_id),
    FOREIGN KEY (place_id) REFERENCES m_place(place_id)
) ENGINE=InnoDB DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_bin;

-- m_balance
CREATE TABLE IF NOT EXISTS m_balance
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
    FOREIGN KEY (kind_id) REFERENCES m_kind(kind_id),
    FOREIGN KEY (purpose_id) REFERENCES m_purpose(purpose_id),
    FOREIGN KEY (place_id) REFERENCES m_place(place_id)
) ENGINE=InnoDB DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_bin;
