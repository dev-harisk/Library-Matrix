# LIBRARY MATRIX


## Description
LibraryMatrix is a comprehensive database designed to streamline and enhance the management of library systems. This robust platform serves as a centralized repository for all information related to the library, ensuring efficient organization and easy access to critical data. The database includes tables for authors, books, genres, members, transactions, and librarians, along with procedures and triggers to maintain data integrity and automate processes.

## Key Features
- **Centralized Database**: A single repository for all library-related information, improving data management.
- **Structured Tables**: Well-defined tables for authors, books, genres, members, transactions, and librarians.
- **Data Integrity**: Foreign key constraints to ensure relationships between tables are maintained.
- **Stored Procedures**: Procedures for inserting authors, retrieving authors by genre, and getting book titles by author.
- **Triggers**: Automated actions for maintaining book availability and managing transaction dates.
- **Sample Data**: Demo data included for testing and demonstration purposes.

## Database Schema
The following tables are created in the `libsys_db` database:
- `authors`: Stores information about authors.
- `genre`: Stores information about book genres.
- `books`: Stores information about books, including foreign keys for authors and genres.
- `book_availability`: Tracks the availability of books.
- `members`: Stores information about library members.
- `transactions`: Records book transactions between members and the library.
- `librarian`: Stores information about library staff.

## Installation Instructions
To set up the LibraryMatrix database, follow these steps:

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/yourusername/librarymatrix.git
   
2. **Open your SQL Client (e.g., MySQL Workbench, phpMyAdmin).**
3. **Run the SQL Scripts:**
	- Open the SQL script file provided in this repository.
	- Execute the script to create the libsys_db database and its tables, along with sample data.

## Usage
After setting up the database, you can use it to manage library operations. The SQL scripts include procedures for managing authors and books, as well as triggers to automate processes related to transactions and book availability.
## Sample Queries
- To retrieve all books with their authors and genres:
	```bash
	SELECT * FROM get_book_details;
	
- To view transaction details:
	```bash
	SELECT * FROM transaction_details;
	






