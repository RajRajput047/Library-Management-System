-- Create Database
CREATE DATABASE LibraryDB;
USE LibraryDB;

-- Create Tables
CREATE TABLE Books (
    BookID INT PRIMARY KEY AUTO_INCREMENT,
    Title VARCHAR(255) NOT NULL,
    Author VARCHAR(255),
    Available INT DEFAULT 1
);

CREATE TABLE Users (
    UserID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(255) NOT NULL,
    Email VARCHAR(255) UNIQUE
);

CREATE TABLE Borrowed_Books (
    BorrowID INT PRIMARY KEY AUTO_INCREMENT,
    UserID INT,
    BookID INT,
    BorrowDate DATE DEFAULT CURRENT_DATE,
    ReturnDate DATE,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);

-- Insert Sample Data
INSERT INTO Books (Title, Author) VALUES 
('The Great Gatsby', 'F. Scott Fitzgerald'),
('1984', 'George Orwell'),
('To Kill a Mockingbird', 'Harper Lee');

INSERT INTO Users (Name, Email) VALUES 
('Alice Johnson', 'alice@example.com'),
('Bob Smith', 'bob@example.com');

-- Borrow a Book
INSERT INTO Borrowed_Books (UserID, BookID) VALUES (1, 2);

-- Update Book Availability
UPDATE Books SET Available = Available - 1 WHERE BookID = 2;

-- Return a Book
UPDATE Borrowed_Books SET ReturnDate = CURRENT_DATE WHERE BorrowID = 1;
UPDATE Books SET Available = Available + 1 WHERE BookID = 2;

-- View Borrowed Books with User Info
SELECT b.Title, u.Name, bb.BorrowDate, bb.ReturnDate 
FROM Borrowed_Books bb
JOIN Books b ON bb.BookID = b.BookID
JOIN Users u ON bb.UserID = u.UserID;
