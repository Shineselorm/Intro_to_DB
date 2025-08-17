-- =============================================================
-- ALX BOOK STORE SCHEMA
-- Database: alx_book_store
-- Author: Shine Selorm
-- Description: Core tables for an online bookstore.
-- Note: All SQL keywords are in UPPERCASE as required.
-- MySQL 8.0+ is recommended.
-- =============================================================

-- 1) CREATE DATABASE (IF NOT EXISTS) AND USE IT
CREATE DATABASE IF NOT EXISTS alx_book_store;
USE alx_book_store;

-- 2) AUTHORS
CREATE TABLE IF NOT EXISTS Authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    author_name VARCHAR(215) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 3) CUSTOMERS
CREATE TABLE IF NOT EXISTS Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(215) NOT NULL,
    email VARCHAR(215) NOT NULL UNIQUE,
    address TEXT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 4) BOOKS
CREATE TABLE IF NOT EXISTS Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(130) NOT NULL,
    author_id INT NOT NULL,
    price DOUBLE NOT NULL CHECK (price >= 0),
    publication_date DATE,
    CONSTRAINT fk_books_authors
        FOREIGN KEY (author_id)
        REFERENCES Authors(author_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 5) ORDERS
CREATE TABLE IF NOT EXISTS Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    CONSTRAINT fk_orders_customers
        FOREIGN KEY (customer_id)
        REFERENCES Customers(customer_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 6) ORDER_DETAILS
CREATE TABLE IF NOT EXISTS Order_Details (
    orderdetailid INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    book_id INT NOT NULL,
    quantity DOUBLE NOT NULL CHECK (quantity > 0),
    CONSTRAINT fk_orderdetails_orders
        FOREIGN KEY (order_id)
        REFERENCES Orders(order_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT fk_orderdetails_books
        FOREIGN KEY (book_id)
        REFERENCES Books(book_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- =============================================================
-- OPTIONAL: SAMPLE DATA FOR QUICK TESTING (UNCOMMENT TO USE)
-- =============================================================
/*
INSERT INTO Authors (author_name) VALUES
('Chimamanda Ngozi Adichie'),
('Chinua Achebe'),
('Ngũgĩ wa Thiong’o');

INSERT INTO Customers (customer_name, email, address) VALUES
('Ama Mensah', 'ama@example.com', 'Accra, Ghana'),
('Kofi Boateng', 'kofi@example.com', 'Kumasi, Ghana');

INSERT INTO Books (title, author_id, price, publication_date) VALUES
('Half of a Yellow Sun', 1, 95.50, '2006-09-12'),
('Things Fall Apart', 2, 60.00, '1958-01-01'),
('Petals of Blood', 3, 72.75, '1977-01-01');

INSERT INTO Orders (customer_id, order_date) VALUES
(1, '2025-08-15'),
(2, '2025-08-16');

INSERT INTO Order_Details (order_id, book_id, quantity) VALUES
(1, 1, 1),
(1, 2, 2),
(2, 3, 1);
*/

-- =============================================================
-- OPTIONAL: TEST QUERIES (UNCOMMENT TO USE)
-- =============================================================
/*
-- SHOW ALL TABLES
SHOW TABLES;

-- CHECK STRUCTURE
DESCRIBE Authors;
DESCRIBE Customers;
DESCRIBE Books;
DESCRIBE Orders;
DESCRIBE Order_Details;

-- VIEW ORDER TOTALS
SELECT
    o.order_id,
    c.customer_name,
    o.order_date,
    SUM(od.quantity * b.price) AS order_total
FROM Orders o
JOIN Customers c ON c.customer_id = o.customer_id
JOIN Order_Details od ON od.order_id = o.order_id
JOIN Books b ON b.book_id = od.book_id
GROUP BY o.order_id, c.customer_name, o.order_date
ORDER BY o.order_id;
*/
