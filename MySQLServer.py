import mysql.connector
from mysql.connector import Error

def create_database():
    try:
        # Establish connection to MySQL Server
        # Note: You may need to update 'user' and 'password' according to your MySQL configuration
        connection = mysql.connector.connect(
            host='localhost',
            user='root',
            password=''
        )

        if connection.is_connected():
            cursor = connection.cursor()
            # Create the database if it doesn't exist
            cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")
            print("Database 'alx_book_store' created successfully!")

    except mysql.connector.Error as e:
        # Print error message if connection fails or query fails
        print(f"Error connecting to MySQL Server: {e}")

    finally:
        # Close the cursor and connection
        if 'cursor' in locals() and cursor:
            cursor.close()
        if 'connection' in locals() and connection.is_connected():
            connection.close()

if __name__ == "__main__":
    create_database()