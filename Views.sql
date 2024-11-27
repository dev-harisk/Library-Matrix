-- Create or replace a view named 'get_book_details' to retrieve detailed information about books

CREATE OR REPLACE VIEW get_book_details AS
SELECT 
    b.book_id AS book_id,                  -- Unique identifier for the book
    b.title AS title,                      -- Title of the book
    b.author_id AS author_id,              -- Unique identifier for the author
    a.author_name AS author_name,          -- Name of the author
    b.genre_id AS genre_id,                -- Unique identifier for the genre
    g.genre_name AS genre_name,            -- Name of the genre
    b.publisher AS publisher,               -- Publisher of the book
    b.published_year AS published_year,    -- Year the book was published
    b.isbn AS isbn,                        -- ISBN number of the book
    b.no_of_copies AS no_of_copies         -- Number of copies available
FROM 
    books b                                 -- Books table
JOIN 
    authors a ON b.author_id = a.author_id  -- Join with authors table
JOIN 
    genre g ON b.genre_id = g.genre_id      -- Join with genre table
ORDER BY 
    b.book_id DESC;                        -- Order results by book_id in descending order


-- Create or replace a view named 'transaction_details' to retrieve detailed information about transactions

CREATE OR REPLACE VIEW transaction_details AS
SELECT 
    t.transaction_id AS transaction_id,  -- Unique identifier for each transaction
    m.full_name AS full_name,             -- Full name of the member
    t.book_id AS book_id,                 -- Unique identifier for the book
    b.title AS title,                      -- Title of the book
    t.issue_date AS issue_date,           -- Date the book was issued
    t.due_date AS due_date,               -- Due date for returning the book
    t.return_date AS return_date,         -- Date the book was returned
    t.fine_amount AS fine_amount           -- Fine amount for late returns
FROM 
    transactions t                         -- Transactions table
JOIN 
    books b ON t.book_id = b.book_id      -- Join with books table
JOIN 
    members m ON t.member_id = m.member_id -- Join with members table;