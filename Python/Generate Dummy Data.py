# Import the library
import pandas as pd
from faker import Faker
from datetime import timedelta, datetime
import random

fake = Faker()

# Define constants
num_users = 50
num_libraries = 10
num_books = 100
num_loans = 200
num_holds = 120

# Define Books Categories
categories = ['Romance','Fantasy','Science Fiction (Sci-Fi)','Horror','Mystery','Thriller','Comedy','Biography']

# Generate dummy data for each table

def generate_user_data(num_users):
    users = []
    for _ in range(num_users):
        users.append({
            'user_id': fake.unique.random_int(min=1, max=9999),
            'username': fake.user_name(),
            'email': fake.email(),
            'password': fake.password(),
            'address': fake.address()
        })
    return pd.DataFrame(users)


def generate_library_data(num_libraries):
    libraries = []
    for _ in range(num_libraries):
        libraries.append({
            'library_id': fake.unique.random_int(min=1, max=9999),
            'name': fake.company(),
            'address': fake.street_address()
        })
    return pd.DataFrame(libraries)

def generate_book_data(num_books):
    books = []
    for _ in range(num_books):
        books.append({
            'book_id': fake.unique.random_int(min=1, max=9999),
            'title': fake.sentence(nb_words=5).title(),
            'author': fake.name(),
        })
    return pd.DataFrame(books)

def generate_category_data():
    category_list = []
    for category in categories:
        category_list.append({
            'category_id': fake.unique.random_int(min=1, max=9999),
            'category_name': category
        })
    return pd.DataFrame(category_list)

def generate_library_book_data(books,libraries):
    library_book = []
    for _, book in books.iterrows():
        for _, library in libraries.iterrows():
            if random.random() < 0.5:
                library_book.append({
                    'library_id': library['library_id'],
                    'book_id': book['book_id'],
                    'quantity': random.randint(1, 10),
        })
    return pd.DataFrame(library_book)

def generate_book_category_data(books,categories):
    book_category = []
    for _, book in books.iterrows():
        for _, category in categories.iterrows():
            if random.random() < 0.5:
                book_category.append({
                    'book_id': book['book_id'],
                    'category_id':category['category_id']
        })
    return pd.DataFrame(book_category)
def generate_loans_data(num_loans, library_book,user):
    loans = []
    for _ in range(num_loans):
        loan_date = fake.date_between(start_date='-1y', end_date='today')
        due_date = loan_date + pd.Timedelta(days=14)
        return_date = loan_date + pd.Timedelta(days=random.randint(1, 14)) if random.random() > 0.5 else None
        loans.append({
            'loan_id': fake.unique.random_int(min=1, max=9999),
            'library_id': random.choice(library_book['library_id']),
            'book_id': random.choice(library_book['book_id']),
            'user_id': random.choice(user['user_id']),
            'loan_date': loan_date,
            'due_date': due_date,
            'return_date': return_date
        })
    return pd.DataFrame(loans)

def generate_holds_data(num_holds, library_book, loans,user):
    holds = []
    for _ in range(num_holds):
        hold_date = fake.date_between(start_date='-1y', end_date='today')
        selected_loan = loans[loans['return_date'].notnull()].sample(n=1)
        available_date = selected_loan['return_date'].values[0] if not selected_loan.empty else None
        expiry_date = available_date + pd.Timedelta(days=7) if available_date else None
        holds.append({
            'hold_id': fake.unique.random_int(min=1, max=9999),
            'library_id': random.choice(library_book['library_id']),
            'book_id': random.choice(library_book['book_id']),
            'user_id': random.choice(user['user_id']),
            'hold_date': hold_date,
            'available_date': available_date,
            'expiry_date': expiry_date
        })
    return pd.DataFrame(holds)

# Generate data
user_df = generate_user_data(num_users)
libraries_df = generate_library_data(num_libraries)
books_df = generate_book_data(num_books)
categories_df = generate_category_data()
library_books_df = generate_library_book_data(books_df, libraries_df)
book_categories_df = generate_book_category_data(books_df, categories_df)
loans_df = generate_loans_data(num_loans, library_books_df,user_df)
holds_df = generate_holds_data(num_holds, library_books_df,loans_df,user_df)

# Export to csv
user_df.to_csv('users.csv',index=False)
libraries_df.to_csv('libraries.csv', index=False)
books_df.to_csv('books.csv', index=False)
categories_df.to_csv('categories.csv', index=False)
library_books_df.to_csv('library_books.csv', index=False)
book_categories_df.to_csv('book_categories.csv', index=False)
loans_df.to_csv('loans.csv', index=False)
holds_df.to_csv('holds.csv', index=False)
