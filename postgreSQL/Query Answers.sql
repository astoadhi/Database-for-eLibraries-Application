--Question 1 Which libraries have the most books?
SELECT l.name, COUNT(b.book_id) AS num_books
FROM Library l
JOIN Library_Book lb ON l.library_id = lb.library_id
JOIN Book b ON lb.book_id = b.book_id
GROUP BY l.name
ORDER BY num_books DESC
LIMIT 5;

--Question 2 Which categories are most popular among users?
SELECT c.category_name, COUNT(bc.book_id) AS num_books
FROM Category c
JOIN Book_Category bc ON c.category_id = bc.category_id
JOIN Loan l ON bc.book_id = l.book_id
GROUP BY c.category_name
ORDER BY num_books DESC;

--Question 3 Which users have borrowed the most books?
SELECT u.username, COUNT(l.loan_id) AS num_loans
FROM "User" u
JOIN Loan l ON u.user_id = l.user_id
GROUP BY u.username
ORDER BY num_loans DESC
LIMIT 5;

--Question 4 Which authors have the most borrowed books?
SELECT b.author, COUNT(l.loan_id) AS num_loans
FROM Book b
JOIN Loan l ON b.book_id = l.book_id
GROUP BY b.author
ORDER BY num_loans DESC;

--Question 5 Which book categories have the longest average wait times?
SELECT c.category_name, round(AVG(h.available_date-h.hold_date)) AS avg_wait_time
FROM Category c
JOIN Book_Category bc ON c.category_id = bc.category_id
JOIN Book b ON bc.book_id = b.book_id
JOIN Hold h ON b.book_id = h.book_id
GROUP BY c.category_name
ORDER BY avg_wait_time DESC;

