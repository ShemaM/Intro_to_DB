-- Create Database
IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'alx_book_store')
BEGIN
    CREATE DATABASE alx_book_store;
END
GO
USE alx_book_store;
GO

-- Authors Table
CREATE TABLE AUTHORS (
    author_id INT IDENTITY(1,1) PRIMARY KEY,
    author_name VARCHAR(215) NOT NULL
);

-- Books Table
CREATE TABLE BOOKS (
    book_id INT IDENTITY(1,1) PRIMARY KEY,
    title VARCHAR(130) NOT NULL,
    author_id INT,
    price FLOAT,
    publication_date DATE,
    FOREIGN KEY (author_id) REFERENCES AUTHORS(author_id)
);

-- Customers Table
CREATE TABLE CUSTOMERS (
    customer_id INT IDENTITY(1,1) PRIMARY KEY,
    customer_name VARCHAR(215) NOT NULL,
    email VARCHAR(215),
    address TEXT
);

-- Orders Table
CREATE TABLE ORDERS (
    order_id INT IDENTITY(1,1) PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES CUSTOMERS(customer_id)
);

-- Order_Details Table
CREATE TABLE ORDER_DETAILS (
    orderdetailid INT IDENTITY(1,1) PRIMARY KEY,
    order_id INT,
    book_id INT,
    quantity FLOAT,
    FOREIGN KEY (order_id) REFERENCES ORDERS(order_id),
    FOREIGN KEY (book_id) REFERENCES BOOKS(book_id)
);
