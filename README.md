# ALX Book Store Database

A comprehensive MySQL database schema for an online bookstore management system, designed as part of the ALX Backend Development program.

## 📚 Project Overview

This project implements a complete relational database schema for managing an online bookstore, including authors, customers, books, orders, and order details. The database is designed with proper normalization, foreign key relationships, and follows MySQL best practices.

## 🗂️ Project Structure

```
Intro_to_DB/
├── README.md                 # This file - project documentation
├── alx_book_store.sql       # Complete database schema and sample data
└── MySQLServer.py           # Python script to create the database
```

## 🗄️ Database Schema

### Core Tables

#### 1. **Authors** (`Authors`)
- **Purpose**: Stores information about book authors
- **Key Fields**: 
  - `author_id` (Primary Key, Auto-increment)
  - `author_name` (VARCHAR 215)

#### 2. **Customers** (`Customers`)
- **Purpose**: Manages customer information
- **Key Fields**:
  - `customer_id` (Primary Key, Auto-increment)
  - `customer_name` (VARCHAR 215)
  - `email` (VARCHAR 215)
  - `address` (TEXT)

#### 3. **Books** (`Books`)
- **Purpose**: Stores book catalog information
- **Key Fields**:
  - `book_id` (Primary Key, Auto-increment)
  - `title` (VARCHAR 130)
  - `author_id` (Foreign Key → Authors.author_id)
  - `price` (DOUBLE)
  - `publication_date` (DATE)

#### 4. **Orders** (`Orders`)
- **Purpose**: Tracks customer orders
- **Key Fields**:
  - `order_id` (Primary Key, Auto-increment)
  - `customer_id` (Foreign Key → Customers.customer_id)
  - `order_date` (DATE)

#### 5. **Order_Details** (`Order_Details`)
- **Purpose**: Stores individual items within each order
- **Key Fields**:
  - `orderdetailid` (Primary Key, Auto-increment)
  - `order_id` (Foreign Key → Orders.order_id)
  - `book_id` (Foreign Key → Books.book_id)
  - `quantity` (DOUBLE)

## 🔗 Database Relationships

```
Authors (1) ←→ (Many) Books
Customers (1) ←→ (Many) Orders
Orders (1) ←→ (Many) Order_Details
Books (1) ←→ (Many) Order_Details
```

## 🚀 Getting Started

### Prerequisites
- MySQL Server 8.0+ installed and running
- Python 3.6+ (for the Python script)
- `mysql-connector-python` package

### Installation

1. **Install Python Dependencies**
   ```bash
   pip install mysql-connector-python
   ```

2. **Create the Database**
   ```bash
   python MySQLServer.py
   ```

3. **Import the Schema**
   ```bash
   mysql -u root -p < alx_book_store.sql
   ```

### Alternative: Manual Setup

1. Connect to MySQL:
   ```bash
   mysql -u root -p
   ```

2. Run the SQL file:
   ```sql
   source alx_book_store.sql;
   ```

## 📊 Sample Data

The schema includes commented sample data featuring:
- **Authors**: Chimamanda Ngozi Adichie, Chinua Achebe, Ngũgĩ wa Thiong'o
- **Customers**: Sample customers from Ghana
- **Books**: Popular African literature titles
- **Orders**: Sample order transactions

To use the sample data, uncomment the INSERT statements in the SQL file.

## 🔍 Sample Queries

The schema includes several useful queries for:
- Viewing all tables
- Checking table structures
- Calculating order totals with joins
- Basic reporting and analytics

## 🛠️ Technical Specifications

- **Database Engine**: InnoDB
- **Character Set**: UTF8MB4 with Unicode collation
- **SQL Standard**: MySQL 8.0+
- **Constraints**: Proper foreign key relationships
- **Indexing**: Primary keys with auto-increment

## 📝 Usage Examples

### Basic Operations

```sql
-- View all books with author names
SELECT b.title, a.author_name, b.price 
FROM Books b 
JOIN Authors a ON b.author_id = a.author_id;

-- Find total sales by customer
SELECT c.customer_name, SUM(od.quantity * b.price) as total_spent
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
JOIN Order_Details od ON o.order_id = od.order_id
JOIN Books b ON od.book_id = b.book_id
GROUP BY c.customer_id, c.customer_name;
```

## 🔧 Configuration

### MySQL Connection Settings
Update the connection parameters in `MySQLServer.py`:
```python
connection = mysql.connector.connect(
    host="localhost",
    user="your_username",
    password="your_password"
)
```

## 📚 Learning Objectives

This project demonstrates:
- **Database Design**: Proper normalization and relationship modeling
- **SQL Skills**: CREATE, INSERT, JOIN, and complex queries
- **Python Integration**: Database connectivity and automation
- **Best Practices**: Foreign keys, constraints, and data integrity


## 📄 License

This project is created for educational purposes as part of the ALX Backend Development curriculum.

## 👨‍💻 Author

**Shine Selorm** - ALX Backend Development Student

---

*Built with ❤️ for learning database management and SQL*
