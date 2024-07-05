-- Load data from CSV files into the corresponding tables

--Users
COPY "User"(user_id, username, email, password,address) 
FROM 'C:\Users\ASUS\Downloads\users.csv' 
DELIMITER ',' 
CSV HEADER;


-- Library
COPY Library(library_id, name, address) 
FROM 'C:\Users\ASUS\Downloads\libraries.csv' 
DELIMITER ',' 
CSV HEADER;

-- Book
COPY Book(book_id,title,author )
FROM 'C:\Users\ASUS\Downloads\books.csv' 
DELIMITER ',' 
CSV HEADER;

-- Category
COPY Category(category_id, category_name) 
FROM 'C:\Users\ASUS\Downloads\categories.csv' 
DELIMITER ',' 
CSV HEADER;

-- LibraryBooks
COPY Library_Book(library_id, book_id, quantity) 
FROM 'C:\Users\ASUS\Downloads\library_books.csv' 
DELIMITER ',' 
CSV HEADER;

-- Book_category
COPY Book_category(book_id, category_id) 
FROM 'C:\Users\ASUS\Downloads\book_categories.csv' 
DELIMITER ',' 
CSV HEADER;

-- Loan
COPY Loan(loan_id, library_id, book_id, user_id, loan_date, due_date, return_date) 
FROM 'C:\Users\ASUS\Downloads\loans.csv' 
DELIMITER ',' 
CSV HEADER;

-- Hold
COPY Hold(hold_id, library_id, book_id, user_id, hold_date, available_date, expiry_date) 
FROM 'C:\Users\ASUS\Downloads\holds.csv' 
DELIMITER ',' 
CSV HEADER;