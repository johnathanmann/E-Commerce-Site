-- DROP DATABASE
DROP DATABASE IF EXISTS ecommerce_db;

-- CREATE DATABASE
CREATE DATABASE ecommerce_db;

CREATE DATABASE category{
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(30) NOT NULL
}

CREATE DATABASE product{
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(30) NOT NULL,
    price DECIMAL NOT NULL,
    stock INT DEFAULT 10,
    category_id INT NOT NULL,
    FOREIGN KEY (category_id)
    REFERENCES category(id)
    ON DELETE SET NULL
}

CREATE DATABASE tag{
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(30) NOT NULL
}

CREATE DATABASE productTag{
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    tag_id INT NOT NULL,
    FOREIGN KEY (product_id)
    REFERENCES product(id)
    ON DELETE SET NULL,
    FOREIGN KEY (tag_id)
    REFERENCES tag(id)
    ON DELETE SET NULL
}