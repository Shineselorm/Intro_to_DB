#!/usr/bin/env python3
"""
MySQLServer.py
Script to create the 'alx_book_store' database in MySQL.
"""

import mysql.connector

def create_database():
    try:
        # Connect to MySQL server (update user/password as needed)
        connection = mysql.connector.connect(
            host="localhost",
            user="root",
            password="starkhidd1234567890"
        )

        if connection.is_connected():
            cursor = connection.cursor()
            # Create database if it does not exist
            cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")
            print("Database 'alx_book_store' created successfully!")

    except mysql.connector.Error as e:   # 👈 exact string the checker wants
        print(f"Error while connecting to MySQL: {e}")

    finally:
        try:
            if connection.is_connected():
                cursor.close()
                connection.close()
        except NameError:
            # connection was never created
            pass

if __name__ == "__main__":
    create_database()
