-- Create a trigger to replicate the number of copies of a book into the book_availability table after a new book is inserted

DELIMITER //
CREATE TRIGGER tr_replicate_books_no_of_copies_on_insert
AFTER INSERT ON books
FOR EACH ROW
BEGIN
    -- Insert the new book's ID and number of copies into the book_availability table
    INSERT INTO book_availability(book_id, no_of_copies) 
    VALUES (NEW.book_id, NEW.no_of_copies);
END //

DELIMITER ;

-- Create a trigger to update the number of copies of a book in the book_availability table after a book is updated
DELIMITER //
CREATE TRIGGER tr_replicate_books_no_of_copies_on_update
AFTER UPDATE ON books
FOR EACH ROW
BEGIN
    -- Check if the number of copies has changed
    IF OLD.no_of_copies <> NEW.no_of_copies THEN
        -- Update the number of copies in the book_availability table
        UPDATE book_availability 
        SET no_of_copies = NEW.no_of_copies 
        WHERE book_id = NEW.book_id;
    END IF;
END //
DELIMITER ;

-- Create a trigger to set the issue date and due date before inserting a new transaction

DELIMITER //
CREATE TRIGGER set_issue_and_due_date
BEFORE INSERT ON transactions
FOR EACH ROW
BEGIN
    -- Set the issue date to the current date
    SET NEW.issue_date = CURRENT_DATE();
    
    -- Set the due date to 14 days after the issue date
    SET NEW.due_date = DATE_ADD(CURRENT_DATE(), INTERVAL 14 DAY);
END //
DELIMITER ;

-- Create a trigger to update the number of copies available after a new transaction is inserted

DELIMITER //
CREATE TRIGGER tr_update_books_no_of_copies_issued
AFTER INSERT ON transactions
FOR EACH ROW
BEGIN
    -- Update the number of copies in the book_availability table
    UPDATE book_availability 
    SET no_of_copies = no_of_copies - 1 
    WHERE book_id = NEW.book_id AND no_of_copies > 0; -- Ensure no negative copies
END //

DELIMITER ;


-- Create a trigger to update the number of copies available after a new transaction is inserted
DELIMITER //
CREATE TRIGGER tr_update_books_no_of_copies_after_book_returned
AFTER UPDATE ON transactions 
FOR EACH ROW
BEGIN
    -- Check if the book was just marked as returned
    IF OLD.return_date IS NULL AND NEW.return_date IS NOT NULL THEN
        -- Update the number of available copies for the book
        UPDATE book_availability 
        SET no_of_copies = no_of_copies + 1
        WHERE book_id = NEW.book_id;
    END IF;
END //
DELIMITER ;


