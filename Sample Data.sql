-- Insert multiple genres into the 'genre' table.
-- This table is used to categorize books into different genres for better organization and retrieval.
-- The following genres are being added:
-- 
-- 1. Fiction: A literary work based on the imagination and not necessarily on fact.
-- 2. Non-Fiction: A genre that presents factual information and real events.
-- 3. Mystery: A genre that involves suspenseful events and often a crime to be solved.
-- 4. Thriller: A genre characterized by excitement and suspense, often involving danger.
-- 5. Fantasy: A genre that includes magical elements and fantastical worlds.
-- 6. Science Fiction: A genre that explores futuristic concepts, advanced technology, and space exploration.
-- 7. Biography: A detailed description of a person's life, written by someone else.
-- 8. Romance: A genre focused on romantic relationships and emotional connections.
-- 9. Historical Fiction: A genre that combines fictional stories with historical events or settings.
-- 10. Self-Help: A genre that provides guidance and strategies for personal improvement.
-- 11. Horror: A genre intended to frighten, scare, or disturb the audience.
-- 12. Adventure: A genre that involves exciting and often dangerous journeys or quests.
-- 13. Poetry: A literary genre that expresses ideas and emotions through rhythmic and metaphorical language.
-- 14. Graphic Novel: A genre that combines visual art with narrative storytelling, often in comic book format.
-- 15. Young Adult: A genre targeted towards teenage readers, often dealing with themes relevant to young adults.
-- 16. Technology: A genre that explores themes related to technology and its impact on society.
-- 17. Classic: A genre that includes works recognized for their literary merit and lasting significance.
-- 18. Dystopian: A genre that explores social and political structures in a dark, nightmare world.
-- 19. Coming-of-age: A genre that focuses on the growth and development of a protagonist from youth to adulthood.
-- 
-- The following SQL statement inserts these genres into the 'genre' table:

INSERT INTO genre (genre_name) VALUES 
('Fiction'),
('Non-Fiction'),
('Mystery'),
('Thriller'),
('Fantasy'),
('Science Fiction'),
('Biography'),
('Romance'),
('Historical Fiction'),
('Self-Help'),
('Horror'),
('Adventure'),
('Poetry'),
('Graphic Novel'),
('Young Adult'),
('Technology'),
('Classic'),
('Dystopian'),
('Coming-of-age');


-- Inserting demo data into the 'authors' table to populate it with sample author information, including names, email addresses, and countries of origin.

INSERT INTO authors (author_name, author_email, author_country) VALUES 
('J.K. Rowling', 'jk.rowling@example.com', 'United Kingdom'),
('George R.R. Martin', 'george.martin@example.com', 'United States'),
('Agatha Christie', 'agatha.christie@example.com', 'United Kingdom'),
('Mark Twain', 'mark.twain@example.com', 'United States'),
('Haruki Murakami', 'haruki.murakami@example.com', 'Japan'),
('Chinua Achebe', 'chinua.achebe@example.com', 'Nigeria'),
('Jane Austen', 'jane.austen@example.com', 'United Kingdom'),
('Stephen King', 'stephen.king@example.com', 'United States'),
('Isabel Allende', 'isabel.allende@example.com', 'Chile'),
('Gabriel García Márquez', 'gabriel.garcia@example.com', 'Colombia');

-- Inserting demo data into the 'books' table to populate it with sample book information, including ISBN, title, publisher, published year, no of copies, genre id, author id.

INSERT INTO books (isbn, title, publisher, published_year, no_of_copies, genre_id, author_id) VALUES 
('978-3-16-148410-0', 'Harry Potter and the Philosophers Stone', 'Bloomsbury', 1997, 10, 1, 1),
('978-0-7432-7356-5', 'A Game of Thrones', 'Bantam Books', 1996, 5, 2, 2),
('978-0-06-112008-4', 'To Kill a Mockingbird', 'J.B. Lippincott & Co.', 1960, 8, 3, 3),
('978-0-452-28423-4', 'The Great Gatsby', 'Charles Scribners Sons', 1925, 6, 3, 4),
('978-1-56619-909-4', 'Norwegian Wood', 'Harvill Secker', 1987, 7, 3, 5),
('978-0-14-028333-4', 'Things Fall Apart', 'Heinemann', 1958, 4, 3, 6),
('978-0-19-953556-9', 'Pride and Prejudice', 'T. Egerton', 1913, 9, 4, 7),
('978-1-5011-2630-0', 'The Shining', 'Doubleday', 1977, 12, 5, 8),
('978-0-06-231500-7', 'The House of the Spirits', 'Alfred A. Knopf', 1982, 3, 6, 9),
('978-0-06-088328-7', 'One Hundred Years of Solitude', 'Harper & Row', 1967, 2, 6, 10);

-- Inserting demo data into the 'members' table to populate it with sample member information name, email, membership type, age, address.

INSERT INTO members (full_name, address, email, membership_type, age) VALUES 
('Alice Johnson', '123 Maple St, Springfield', 'alice.johnson@example.com', 'Student', 20),
('Bob Smith', '456 Oak St, Springfield', 'bob.smith@example.com', 'General', 35),
('Charlie Brown', '789 Pine St, Springfield', 'charlie.brown@example.com', 'Temporary', 28),
('Diana Prince', '321 Elm St, Springfield', 'diana.prince@example.com', 'Senior citizen', 65),
('Ethan Hunt', '654 Cedar St, Springfield', 'ethan.hunt@example.com', 'Faculty', 45),
('Fiona Gallagher', '987 Birch St, Springfield', 'fiona.gallagher@example.com', 'Student', 22),
('George Costanza', '135 Willow St, Springfield', 'george.costanza@example.com', 'General', 40),
('Hannah Baker', '246 Spruce St, Springfield', 'hannah.baker@example.com', 'Temporary', 30);

-- Inserting demo data into the 'transactions' table to populate it with sample transaction information, including book ID, member ID, issue date, due date, return date, and fine amount.

INSERT INTO transactions (book_id, member_id, issue_date, due_date, return_date, fine_amount)
VALUES
  (5, 10, '2023-11-15', '2023-12-15', '2023-12-10', 0.00),
  (12, 5, '2023-10-20', '2023-11-20', '2023-11-25', 15.00),
  (3, 8, '2024-01-05', '2024-02-05', NULL, 0.00),
  (18, 15, '2023-09-25', '2023-10-25', '2023-10-20', 0.00),
  (7, 12, '2023-12-01', '2024-01-01', '2024-01-05', 5.00),
  (2, 6, '2024-02-10', '2024-03-10', NULL, 0.00),
  (15, 9, '2023-11-28', '2023-12-28', '2024-01-02', 20.00),
  (10, 4, '2023-10-15', '2023-11-15', '2023-11-10', 0.00),
  (1, 11, '2024-01-20', '2024-02-20', NULL, 0.00),
  (19, 7, '2023-12-12', '2024-01-12', '2024-01-10', 0.00);


-- Inserting demo data into the 'librarian' table to populate it with sample librarian information, including names, addresses, emails, and login passwords.

INSERT INTO librarian (librarian_name, login_password, librarian_address, librarian_email) VALUES 
('John Doe', 'Nimda@36', '123 Library Lane, Springfield', 'john.doe@example.com');
