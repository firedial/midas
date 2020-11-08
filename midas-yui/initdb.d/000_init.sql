CREATE DATABASE IF NOT EXISTS midas CHARACTER SET utf8mb4 COLLATE utf8mb4_bin;
USE midas;


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

-- m_attribute_element
CREATE TABLE IF NOT EXISTS m_kind_element
(
    kind_element_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY UNIQUE,  
    kind_element_name VARCHAR(20) NOT NULL UNIQUE,
    kind_element_description VARCHAR(20) NOT NULL,
	kind_category_id INT NOT NULL,
    INDEX(kind_element_name),
    INDEX(kind_category_id),
    FOREIGN KEY (kind_category_id) REFERENCES m_kind_category(kind_category_id)
) ENGINE=InnoDB DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_bin;

CREATE TABLE IF NOT EXISTS m_purpose_element
(
    purpose_element_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY UNIQUE,  
    purpose_element_name VARCHAR(20) NOT NULL UNIQUE,
    purpose_element_description VARCHAR(20) NOT NULL,
	purpose_category_id INT NOT NULL,
    INDEX(purpose_element_name),
    INDEX(purpose_category_id),
    FOREIGN KEY (purpose_category_id) REFERENCES m_purpose_category(purpose_category_id)
) ENGINE=InnoDB DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_bin;

CREATE TABLE IF NOT EXISTS m_place_element
(
    place_element_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY UNIQUE,  
    place_element_name VARCHAR(20) NOT NULL UNIQUE,
    place_element_description VARCHAR(20) NOT NULL,
	place_category_id INT NOT NULL,
    INDEX(place_element_name),
    INDEX(place_category_id),
    FOREIGN KEY (place_category_id) REFERENCES m_place_category(place_category_id)
) ENGINE=InnoDB DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_bin;


-- m_attribute_group_relation
CREATE TABLE IF NOT EXISTS m_kind_group_relation
(
    kind_group_id INT NOT NULL,  
    kind_element_id INT NOT NULL,  
    INDEX(kind_group_id, kind_element_id),
    INDEX(kind_element_id, kind_group_id),
    PRIMARY KEY(kind_group_id, kind_element_id),
    FOREIGN KEY (kind_group_id) REFERENCES m_kind_group(kind_group_id),
    FOREIGN KEY (kind_element_id) REFERENCES m_kind_element(kind_element_id)
) ENGINE=InnoDB DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_bin;

CREATE TABLE IF NOT EXISTS m_purpose_group_relation
(
    purpose_group_id INT NOT NULL,  
    purpose_element_id INT NOT NULL,  
    INDEX(purpose_group_id, purpose_element_id),
    INDEX(purpose_element_id, purpose_group_id),
    PRIMARY KEY(purpose_group_id, purpose_element_id),
    FOREIGN KEY (purpose_group_id) REFERENCES m_purpose_group(purpose_group_id),
    FOREIGN KEY (purpose_element_id) REFERENCES m_purpose_element(purpose_element_id)
) ENGINE=InnoDB DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_bin;

CREATE TABLE IF NOT EXISTS m_place_group_relation
(
    place_group_id INT NOT NULL,  
    place_element_id INT NOT NULL,  
    INDEX(place_group_id, place_element_id),
    INDEX(place_element_id, place_group_id),
    PRIMARY KEY(place_group_id, place_element_id),
    FOREIGN KEY (place_group_id) REFERENCES m_place_group(place_group_id),
    FOREIGN KEY (place_element_id) REFERENCES m_place_element(place_element_id)
) ENGINE=InnoDB DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_bin;

-- m_balance
CREATE TABLE IF NOT EXISTS m_balance
(
    balance_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY UNIQUE,  
    amount INT NOT NULL,
    item VARCHAR(50) NOT NULL,
    kind_element_id INT NOT NULL,
    purpose_element_id INT NOT NULL,
    place_element_id INT NOT NULL,
    date DATE NOT NULL,
    INDEX(kind_element_id),
    INDEX(purpose_element_id),
    INDEX(place_element_id),
    INDEX(date),
    FOREIGN KEY (kind_element_id) REFERENCES m_kind_element(kind_element_id),
    FOREIGN KEY (purpose_element_id) REFERENCES m_purpose_element(purpose_element_id),
    FOREIGN KEY (place_element_id) REFERENCES m_place_element(place_element_id)
) ENGINE=InnoDB DEFAULT CHARACTER SET=utf8mb4 COLLATE=utf8mb4_bin;
