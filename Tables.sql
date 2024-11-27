-- Create a table named 'authors' to store information about authors in the library

CREATE TABLE authors (
  author_id int NOT NULL AUTO_INCREMENT,  -- Unique identifier for each author, auto-incremented
  author_name varchar(100) NOT NULL,  -- Name of the author, required field
  author_email varchar(100) DEFAULT NULL,  -- Email address of the author, optional field
  author_country varchar(100) DEFAULT NULL,  -- Country of the author, optional field
  PRIMARY KEY (author_id)  -- Set 'author_id' as the primary key for the table
);

-- Create a table named 'genre' to store information about book genres

CREATE TABLE genre (
  genre_id int NOT NULL AUTO_INCREMENT,  -- Unique identifier for each genre, auto-incremented
  genre_name varchar(100) NOT NULL,  -- Name of the genre, required field
  PRIMARY KEY (genre_id),  -- Set 'genre_id' as the primary key for the table
  UNIQUE KEY genre_name (genre_name)  -- Ensure that each genre name is unique
);

-- Create a table named 'books' to store information about books in the library

CREATE TABLE books (
  isbn varchar(20) DEFAULT NOT NULL,  -- ISBN number of the book, optional field
  book_id int NOT NULL AUTO_INCREMENT,  -- Unique identifier for each book, auto-incremented
  title varchar(250) NOT NULL,  -- Title of the book, required field
  publisher varchar(200) DEFAULT NULL,  -- Publisher of the book, optional field
  published_year year NULL,  -- Year the book was published, required field
  -- genre varchar(150) DEFAULT NULL,  -- Genre of the book, optional field
  no_of_copies int NOT NULL,  -- Number of copies available in the library, required field
  genre_id int NOT NULL,  -- Foreign key referencing the genre of the book
  author_id int NOT NULL,  -- Foreign key referencing the author of the book
  PRIMARY KEY (book_id),  -- Set 'book_id' as the primary key for the table
  KEY fk_author_id (author_id),  -- Index for the 'author_id' foreign key
  KEY fk_genre_id (genre_id),  -- Index for the 'genre_id' foreign key
  CONSTRAINT fk_author_id FOREIGN KEY (author_id) REFERENCES authors (author_id),  -- Foreign key constraint linking to 'authors' table
  CONSTRAINT fk_genre_id FOREIGN KEY (genre_id) REFERENCES genre (genre_id)  -- Foreign key constraint linking to 'genre' table
);

-- Create a table named 'book_availability' to track the availability of books in the library

CREATE TABLE book_availability (
  book_id int NOT NULL,  -- Foreign key referencing the unique identifier of the book
  no_of_copies int DEFAULT NULL,  -- Number of copies available for the book, optional field
  PRIMARY KEY (book_id),  -- Set 'book_id' as the primary key for the table
  CONSTRAINT fk_book_id FOREIGN KEY (book_id) REFERENCES books (book_id)  -- Foreign key constraint linking to 'books' table
    ON DELETE CASCADE  -- If a book is deleted, its availability record will also be deleted
    ON UPDATE CASCADE  -- If the book ID is updated, the change will be reflected in this table
);

-- Create a table named 'members' to store information about library members

CREATE TABLE members (
  member_id int NOT NULL AUTO_INCREMENT,  -- Unique identifier for each member, auto-incremented
  full_name varchar(50) NOT NULL,  -- Full name of the member, required field
  address varchar(250) DEFAULT NULL,  -- Address of the member, optional field
  email varchar(250) NOT NULL,  -- Email address of the member, required field
  membership_type enum('Student','General','Temporary','Senior citizen','Faculty') NOT NULL,  -- Type of membership, required field
  age int DEFAULT NULL,  -- Age of the member, optional field
  PRIMARY KEY (member_id),  -- Set 'member_id' as the primary key for the table
  UNIQUE KEY email (email)  -- Ensure that each email address is unique among members
);

-- Create a table named 'transactions' to store information about book transactions

CREATE TABLE transactions (
  transaction_id int NOT NULL AUTO_INCREMENT,  -- Unique identifier for each transaction, auto-incremented
  book_id int NOT NULL,  -- Foreign key referencing the unique identifier of the book being borrowed
  member_id int NOT NULL,  -- Foreign key referencing the unique identifier of the member borrowing the book
  issue_date date DEFAULT NULL,  -- Date when the book was issued, optional field
  due_date date DEFAULT NULL,  -- Date when the book is due to be returned, optional field
  return_date date DEFAULT NULL,  -- Date when the book was returned, optional field
  fine_amount decimal(10,2) DEFAULT '0.00',  -- Fine amount for overdue books, default is 0.00
  PRIMARY KEY (transaction_id),  -- Set 'transaction_id' as the primary key for the table
  KEY book_id (book_id),  -- Index on 'book_id' for faster lookups
  KEY member_id (member_id),  -- Index on 'member_id' for faster lookups
  CONSTRAINT fk_transaction_book_id FOREIGN KEY (book_id) REFERENCES books (book_id) ON DELETE CASCADE,  -- Foreign key constraint for book
  CONSTRAINT fk_transaction_member_id FOREIGN KEY (member_id) REFERENCES members (member_id) ON DELETE CASCADE  -- Foreign key constraint for member
);

-- Create a table named 'librarian' to store information about library staff

CREATE TABLE librarian (
  librarian_id int NOT NULL AUTO_INCREMENT,  -- Unique identifier for each librarian, auto-incremented
  librarian_name varchar(100) NOT NULL,  -- Name of the librarian, optional field
  login_password varchar(100) NOT NULL,  -- Password for librarian login, optional field
  librarian_address varchar(100) DEFAULT NULL,  -- Address of the librarian, optional field
  librarian_email varchar(100) NOT NULL,  -- Email address of the librarian, required field
  PRIMARY KEY (librarian_id),  -- Set 'librarian_id' as the primary key for the table
  UNIQUE KEY librarian_email_UNIQUE (librarian_email)  -- Ensure that each email address is unique among librarians
);
