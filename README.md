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
3. **Member Data:**
    - Store member information, allowing them to add their card(s) to the app.
    - Registered members should be able to borrow books, place holds, and manage their shelves.
4. **Loan and Hold System:**
    - Track borrowing transactions, including loan dates, due dates, and return dates.
    - Implement a loan period of 2 weeks, with automatic return of books after the due date.
    - Allow members to borrow up to 2 books at a time.
    - Enable members to place holds on books that are currently unavailable.
    - Maintain a hold queue and release held books if not borrowed within one week.
    - Members can hold up to 2 books at a time.

