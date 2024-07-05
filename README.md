# Digital-database-for-library
This project aims to design and implement a digital database for a library, migrating its collection from physical books to digital formats. The goal is to create a robust and scalable database that can store, organize, and retrieve digital content, providing features for searching, browsing, and accessing the digital materials.


# Database Objectives

1.	Design a relational database for a library management system. The application oversees multiple libraries, each hosting a diverse collection of books with varying quantities available for borrowing. Users can borrow or place holds on books (when the book is not immediately available for borrowing). 
2.	Populate the database with dummy data, to check if the database good or not. 
3.	Retrieve data to answer specific questions about the library's collection and circulation.


# Mission Statement 
The mission of this e-library application is to provide a user-friendly platform for managing multiple libraries, storing book information, and facilitating user registration, loan, and hold systems, while ensuring efficient tracking and management of book collections and user interactions.


# Business Rule

1. **Manage Multiple Libraries:**
    - The system should handle data for multiple libraries, each with its own collection of books.
2. **Book Collection:**
    - Store information about books, including titles, authors, genres, and copies available for borrowing.
    - Books should be categorized for easier searching (e.g., self-help, biography, fantasy, romance, historical).
3. **User Registration:**
    - Users can register on the e-library platform.
    - Registered users can interact with the platform by borrowing books, placing holds, and managing their account.
4. **Loan and Hold System:**
    - Users can borrow books from any library in this application if the book is available. 
    - The loan period is 2 weeks. Users can return books earlier than the due date
    - Books will be automatically returned when they exceed the due date
    - Users can only borrow 2 books at a time
    - The platform keeps track of loan transactions, including loan dates, due dates, and return dates.
    - Users can place holds on books that are currently unavailable.
    - The library maintains a hold queue, and when a book becomes available, it can be borrowed by the customer at the front of the queue. Additionally, if a customer doesn't borrow a held book within one week,  the book is released for other users to borrow. 
    - Users can only hold 2 books at the same time


# Technical Requirements
* Database: PostgreSQL
* Programming Language: Python


# ERD DIAGRAM
![](https://github.com/astoadhi/Digital-database-for-library/blob/main/ERD/ERD.png)

