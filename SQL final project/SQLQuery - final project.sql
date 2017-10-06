USE [Library]
GO

	/******************************************************
	 * Build our database tables and define ther schema
	 ******************************************************/
	CREATE TABLE tbl_book (
		bookid INT PRIMARY KEY NOT NULL IDENTITY (1,1),
		title VARCHAR(50) NOT NULL,
		publishername VARCHAR (50) NOT NULL
	);

		CREATE TABLE tbl_book_authors (
		bookid INT PRIMARY KEY NOT NULL IDENTITY (1,1),
		authorname VARCHAR(50) NOT NULL
	);

		CREATE TABLE tbl_publisher (
		pname VARCHAR(50) PRIMARY KEY NOT NULL,
		paddress VARCHAR(50) NOT NULL,
		phone VARCHAR (50) NOT NULL
	);

		CREATE TABLE tbl_book_loans (
		bookid INT PRIMARY KEY NOT NULL IDENTITY (1,1),
		branchid VARCHAR(50) NOT NULL,
		cardno INT NOT NULL,
		dateout DATE NOT NULL,
		duedate DATE NOT NULL
	);

		CREATE TABLE tbl_book_copies (
		bookid INT PRIMARY KEY NOT NULL IDENTITY (1,1),
		branchid VARCHAR(50) NOT NULL,
		no_of_copies INT NOT NULL
	);

		CREATE TABLE tbl_borrower (
		cardno INT PRIMARY KEY NOT NULL IDENTITY (1,1),
		bname VARCHAR(50) NOT NULL,
		baddress VARCHAR(50) NOT NULL,
		phone VARCHAR(50) NOT NULL
	);

		CREATE TABLE tbl_library_branch (
		branchid INT PRIMARY KEY NOT NULL IDENTITY (1,1),
		branchname VARCHAR(50) NOT NULL,
		branchaddress VARCHAR(50) NOT NULL
	);

	SELECT * FROM tbl_library

	/******************************************************
	 * Now that the tables are built, we populate them
	 ******************************************************/

	 	INSERT INTO tbl_book
		(title, publishername)
		VALUES 
		('The Lost Tribe', 'Random House'),
		('IT', 'Random House'),
		('Curious George', 'Penguin'),
		('Morrissey', 'Penguin'),
		('Java', 'NW Books'),
		('Coffee', 'NW Books'),
		('Beans', 'NW Books'),
		('Ryan Adams', 'Penguin'),
		('Italy', 'Random House'),
		('Pit Bulls', 'NW Books'),
		('Mosiquitos', 'Penguin'),
		('Jefferson', 'Random House'),
		('Gardening', 'NW Books'),
		('Reverb', 'Music Press'),
		('Echo', 'Music Press'),
		('Distortion', 'Music Press'),
		('1990s Guitar Tones', 'Music Press'),
		('David Bowie', 'Penguin'),
		('Vegan tacos', 'Food'),
		('Vegan bacon', 'Food'),
		('Vegan desserts', 'Food')
	;
	SELECT * FROM tbl_book;

		INSERT INTO tbl_book_authors
		(authorname)
		VALUES 
		('Mark Lee'),
		('Stephen King'),
		('Jeff Frank'),
		('Steven Morrissey'),
		('Anders Smorgasbord'),
		('Anders Smorgasbord'),
		('Anders Smorgasbord'),
		('Ryan Adams'),
		('Rick Steeves'),
		('Allan Frank'),
		('John Hodgman'),
		('Malcom Gladwell'),
		('John Cleese'),
		('Frank Zappa'),
		('Frank Zappa'),
		('Frank Zappa'),
		('Frank Zappa'),
		('Dylan Jones'),
		('Matthew Kinney'),
		('Matthew Kinney'),
		('Matthew Kinney')
	;
	SELECT * FROM tbl_book_authors;

		INSERT INTO tbl_library_branch
		(branchname, branchaddress)
		VALUES 
		('Sharpstown', '1234 Oak Creek Lane'),
		('Central', '456 Towers Watson Road'),
		('East', '987 Shady Grove Lane'),
		('West', '654 Palm Tree Drive')
	;
	SELECT * FROM tbl_library_branch;

		INSERT INTO tbl_book_loans
		(branchid, cardno, dateout, duedate)
		VALUES 
		(1, 1, '10-10-2017', '05-10-2018'),
		(2, 2, '10-10-2017', '05-10-2018'),
		(3, 3, '10-10-2017', '05-10-2018'),
		(4, 4, '10-10-2017', '05-10-2018'),
		(1, 5, '10-10-2017', '05-10-2018'),
		(2, 6, '10-10-2017', '05-10-2018'),
		(3, 7, '10-10-2017', '05-10-2018'),
		(4, 8, '10-10-2017', '05-10-2018'),
		(1, 9, '10-10-2017', '05-10-2018'),
		(2, 10, '10-10-2017', '05-10-2018'),
		(3, 11, '11-11-2017', '06-11-2018'),
		(4, 12, '11-11-2017', '06-11-2018'),
		(1, 13, '11-11-2017', '06-11-2018'),
		(2, 14, '11-11-2017', '06-11-2018'),
		(3, 15, '11-11-2017', '06-11-2018'),
		(4, 16, '11-11-2017', '06-11-2018'),
		(1, 17, '11-11-2017', '06-11-2018'),
		(2, 18, '11-11-2017', '06-11-2018'),
		(3, 19, '11-11-2017', '06-11-2018'),
		(4, 20, '11-11-2017', '06-11-2018'),
		(1, 21, '06-30-2017', '12-31-2017'),
		(2, 22, '06-30-2017', '12-31-2017'),
		(3, 23, '06-30-2017', '12-31-2017'),
		(4, 24, '06-30-2017', '12-31-2017'),
		(1, 25, '06-30-2017', '12-31-2017'),
		(2, 26, '06-30-2017', '12-31-2017'),
		(3, 27, '06-30-2017', '12-31-2017'),
		(4, 28, '06-30-2017', '12-31-2017'),
		(1, 29, '06-30-2017', '12-31-2017'),
		(2, 30, '06-30-2017', '12-31-2017'),
		(3, 31, '03-31-2017', '06-30-2017'),
		(4, 32, '03-31-2017', '06-30-2017'),
		(1, 33, '03-31-2017', '06-30-2017'),
		(2, 34, '03-31-2017', '06-30-2017'),
		(3, 35, '03-31-2017', '06-30-2017'),
		(4, 36, '03-31-2017', '06-30-2017'),
		(1, 37, '03-31-2017', '06-30-2017'),
		(2, 38, '03-31-2017', '06-30-2017'),
		(3, 39, '03-31-2017', '06-30-2017'),
		(4, 40, '03-31-2017', '06-30-2017'),
		(1, 41, '01-15-2017', '06-15-2017'),
		(2, 42, '01-15-2017', '06-15-2017'),
		(3, 43, '01-15-2017', '06-15-2017'),
		(4, 44, '01-15-2017', '06-15-2017'),
		(1, 45, '01-15-2017', '06-15-2017'),
		(2, 46, '01-15-2017', '06-15-2017'),
		(3, 47, '01-15-2017', '06-15-2017'),
		(4, 48, '01-15-2017', '06-15-2017'),
		(1, 49, '01-15-2017', '06-15-2017'),
		(2, 50, '01-15-2017', '06-15-2017'),
		(3, 51, '01-15-2017', '06-15-2017')
	;

	SELECT * FROM tbl_book_loans;

		INSERT INTO tbl_book_copies
		(branchid, no_of_copies)
		VALUES  
		(1, 5),
		(2, 5),
		(3, 5),
		(4, 5),
		(1, 5),
		(2, 5),
		(3, 5),
		(4, 5),
		(1, 5),
		(2, 5),
		(3, 5),
		(4, 5),
		(1, 5),
		(2, 5),
		(3, 5),
		(4, 5),
		(1, 5),
		(2, 5),
		(3, 5),
		(4, 5),
		(1, 5),
		(2, 5),
		(3, 5),
		(4, 5),
		(1, 5),
		(2, 5),
		(3, 5),
		(4, 5),
		(1, 5),
		(2, 5),
		(3, 5),
		(4, 5),
		(1, 5),
		(2, 5),
		(3, 5),
		(4, 5),
		(1, 5),
		(2, 5),
		(3, 5),
		(4, 5)
	;
	SELECT * FROM tbl_book_copies;

		INSERT INTO tbl_borrower
		(bname, baddress, phone)
		VALUES 
		('jeff cross', '122 fine branch lane', '1234567890'),
		('george sprocket', '123 evergreen drive', '3456734567'),
		('robb wagner', '567 fairfax drive', '7032456789'),
		('jeff ross', '212 ross lane', '5678403400'),
		('justin gioeli', '243 fairfax drive', '3457894000'),
		('amanda segni', '567 chelsea lane', '6789563000'),
		('theordore stevens', '896 jehu lane', '3457893040'),
		('tom scharpling', '346 jersey street', '3457689000'),
		('jon wurster', '325 north carolina rd', '3245678560'),
		('john reis', '343 jehu lane', '3434562345')
	;
	SELECT * FROM tbl_borrower;

	/*****************************************************
	 * The following are database queries.
	 ******************************************************/
	
	USE [Library]
	GO

	CREATE PROCEDURE final_inquiry
	AS

	 	SELECT
		a1.title, a2.bookid, 
		a2.no_of_copies, a3.branchname
		FROM tbl_book a1
		JOIN tbl_book_copies a2 ON a2.bookid = a1.bookid
		JOIN tbl_library_branch a3 ON a3.branchid = a2.branchid
		WHERE a2.branchid = 1 AND a1.title = 'The Lost Tribe'
	;

	 	SELECT
		a1.branchname, a2.bookid, 
		a2.no_of_copies
		FROM tbl_library_branch a1
		JOIN tbl_book_copies a2 ON a2.branchid = a1.branchid
		WHERE a2.bookid = 1
	;

		SELECT
		a1.bname, a1.cardno, 
		a3.bookid, a4.no_of_copies
		FROM tbl_borrower a1
		JOIN tbl_book_loans a2 ON a2.cardno = a1.cardno
		JOIN tbl_book a3 ON a3.bookid = a2.bookid
		JOIN tbl_book_copies a4 ON a4.bookid = a3.bookid
		WHERE a4.no_of_copies = 0
	;
		
		SELECT
		a3.bname, a3.baddress,
		a4.title
		FROM tbl_library_branch a1
		JOIN tbl_book_loans a2 ON a2.branchid = a1.branchid
		JOIN tbl_borrower a3 ON a3.cardno = a2.cardno
		JOIN tbl_book a4 ON a4.bookid = a2.bookid
		WHERE a2.duedate = GETDATE()
	;
		
		SELECT
		a1.branchname,
		SUM(a4.no_of_copies)
		FROM tbl_library_branch a1
		JOIN tbl_book_loans a2 ON a2.branchid = a1.branchid
		JOIN tbl_book a3 ON a3.bookid = a2.bookid
		JOIN tbl_book_copies a4 ON a4.bookid = a3.bookid
		GROUP BY a1.branchname
	;

		SELECT
		a3.bname, a3.baddress,
		a3.phone
		FROM tbl_library_branch a1
		JOIN tbl_book_loans a2 ON a2.branchid = a1.branchid
		JOIN tbl_borrower a3 ON a3.cardno = a2.cardno
		JOIN tbl_book a4 ON a4.bookid = a2.bookid
		JOIN tbl_book_copies a5 ON a5.bookid = a4.bookid
		WHERE a5.no_of_copies >= 5
	;

		SELECT
		a1.title, a3.no_of_copies,
		a2.branchid
		FROM tbl_book a1
		JOIN tbl_book_loans a2 ON a2.bookid = a1.bookid
		JOIN tbl_book_copies a3 ON a3.bookid = a1.bookid
		JOIN tbl_library_branch a4 ON a4.branchid = a3.branchid
		JOIN tbl_book_authors a5 ON a5.bookid = a1.bookid
		WHERE a5.authorname = 'Stephen King' AND a4.branchid = 2 
	;

	GO

	EXEC final_inquiry
