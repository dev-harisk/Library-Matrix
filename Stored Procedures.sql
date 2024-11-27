-- Create a stored procedure to insert an author name if it does not already exist

DELIMITER //
CREATE PROCEDURE insert_author_name(IN new_author_name VARCHAR(45), OUT p_author_id INT)
BEGIN
    -- Attempt to find the author ID based on the provided author name
    SELECT author_id INTO p_author_id 
    FROM authors 
    WHERE author_name = new_author_name;

    -- Check if the author ID was found
    IF p_author_id IS NULL THEN
        -- If not found, insert the new author name into the authors table
        INSERT INTO authors (author_name) VALUES (new_author_name);
        -- Retrieve the last inserted author ID
        SELECT LAST_INSERT_ID() INTO p_author_id;
    END IF;
END //

DELIMITER ;

-- Create a stored procedure to retrieve author names by genre ID

DELIMITER //
CREATE PROCEDURE getAuthorNameByGenreId(IN genre_id INT)
BEGIN
    -- Select distinct author IDs and names for books that match the given genre ID
    SELECT DISTINCT 
        a.author_id,      -- Unique identifier for the author
        a.author_name     -- Name of the author
    FROM 
        books b          -- Books table
    JOIN 
        authors a ON b.author_id = a.author_id  -- Join with authors table
    WHERE 
        b.genre_id = genre_id;  -- Filter by the provided genre ID
END //

DELIMITER ;

-- Create a stored procedure to retrieve book titles by author ID

DELIMITER //
CREATE PROCEDURE getBookTitleByAuthorId(IN author_id INT)
BEGIN
    -- Select distinct book IDs and titles for books written by the specified author
    SELECT DISTINCT 
        b.book_id,      -- Unique identifier for the book
        b.title         -- Title of the book
    FROM 
        books b         -- Books table
    JOIN 
        authors a ON b.author_id = a.author_id  -- Join with authors table
    JOIN 
        genre g ON b.genre_id = g.genre_id      -- Join with genre table (if needed)
    WHERE 
        a.author_id = author_id;  -- Filter by the provided author ID
END //

DELIMITER ;