# 📚 ALX Book Store Database

This project contains the MySQL schema for an online bookstore database called **`alx_book_store`**.  
It is designed to manage books, authors, customers, orders, and order details, demonstrating relational database design using **primary keys** and **foreign keys**.

---

## 📂 Project Structure
Intro_to_DB/

│── alx_book_store.sql # SQL schema file

│── README.md # Documentation


---

## 🗄️ Database Schema

**Database Name:** `alx_book_store`

### Tables
1. **Authors**
   - `author_id` (PK)
   - `author_name`

2. **Books**
   - `book_id` (PK)
   - `title`
   - `author_id` (FK → Authors)
   - `price`
   - `publication_date`

3. **Customers**
   - `customer_id` (PK)
   - `customer_name`
   - `email`
   - `address`

4. **Orders**
   - `order_id` (PK)
   - `customer_id` (FK → Customers)
   - `order_date`

5. **Order_Details**
   - `orderdetailid` (PK)
   - `order_id` (FK → Orders)
   - `book_id` (FK → Books)
   - `quantity`

---

## 🔗 Relationships

- An **Author** can write many **Books**.  
- A **Customer** can place many **Orders**.  
- An **Order** can include many **Books**, and a **Book** can appear in many **Orders** → resolved through **Order_Details** (junction table).  

---

## ▶️ How to Run

1. Clone this repository:
   ```bash
   git clone https://github.com/shineselorm/Intro_to_DB.git
   cd Intro_to_DB

2. Import the schema into MySQL:

mysql -u root -p < alx_book_store.sql

3. Select the database and verify tables:

USE alx_book_store;
SHOW TABLES;
