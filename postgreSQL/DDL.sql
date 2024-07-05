-- Library table
CREATE TABLE Library (
  library_id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  address VARCHAR(255) NOT NULL
);

-- Book table
CREATE TABLE Book (
  book_id SERIAL PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  author VARCHAR(255) NOT NULL
);

-- Library_Book table
CREATE TABLE Library_Book (
  library_id INTEGER NOT NULL,
  book_id INTEGER NOT NULL,
  quantity INTEGER NOT NULL,
  PRIMARY KEY (library_id, book_id),
  FOREIGN KEY (library_id) REFERENCES Library(library_id),
  FOREIGN KEY (book_id) REFERENCES Book(book_id)
);

-- Category table
CREATE TABLE Category (
  category_id SERIAL PRIMARY KEY,
  category_name VARCHAR(255) NOT NULL
);

-- Book_Category table
CREATE TABLE Book_Category (
  book_id INTEGER NOT NULL,
  category_id INTEGER NOT NULL,
  PRIMARY KEY (book_id, category_id),
  FOREIGN KEY (book_id) REFERENCES Book(book_id),
  FOREIGN KEY (category_id) REFERENCES Category(category_id)
);



-- User table
CREATE TABLE "User" (
  user_id SERIAL PRIMARY KEY,
  username VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  password VARCHAR(255) NOT NULL,
  address VARCHAR(255) NOT NULL
);

-- Loan table
CREATE TABLE Loan (
  loan_id SERIAL PRIMARY KEY,
  library_id INTEGER NOT NULL,
  book_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL,
  loan_date DATE NOT NULL,
  due_date DATE NOT NULL,
  return_date DATE DEFAULT NULL CHECK (return_date IS NULL OR return_date <= due_date),
  FOREIGN KEY (library_id) REFERENCES Library(library_id),  
  FOREIGN KEY (book_id) REFERENCES Book(book_id),
  FOREIGN KEY (user_id) REFERENCES "User"(user_id)
);

-- Hold table
CREATE TABLE Hold (
    hold_id SERIAL PRIMARY KEY,
    library_id INT NOT NULL,
    book_id INT NOT NULL,
    user_id INT NOT NULL,
    hold_date DATE NOT NULL,
    available_date DATE DEFAULT NULL,
    expiry_date DATE DEFAULT NULL CHECK (expiry_date IS NULL OR available_date IS NOT NULL),
    FOREIGN KEY (library_id) REFERENCES Library(library_id),
    FOREIGN KEY (book_id) REFERENCES Book(book_id),
    FOREIGN KEY (user_id) REFERENCES "User"(user_id)
);