-- Library Management System Project 

-- Creating Branch table

Drop table if exists branch;
Create table Branch (
	branch_id Varchar(10) Primary key,
	manager_id Varchar(30),
	branch_address Varchar(55),
	contact_no VARCHAR(30)
);

Drop table if exists employees;
CREATE TABLE employees(
	emp_id VARCHAR(10) primary key,
	emp_name VARCHAR(55),
	position VARCHAR(30),
	salary int,
	branch_id VARCHAR(25) -- FK
);


Drop table if exists books;
Create TABLE books(
	isbn VARCHAR(30) Primary Key,
	book_title VARCHAR(75),
	category VARCHAR(30),
	rental_price FLOAT,
	status VARCHAR(20),
	author VARCHAR(35),
	publisher VARCHAR(55)
);

Drop table if exists members;
  CREATE TABLE members
		(
			member_id varchar(10) primary key,
            member_name varchar(30),
            member_address varchar(75),
            reg_date date
		);

Drop table if exists issued_status;
 CREATE TABLE issued_status
	( 
		issued_id Varchar(10) primary key,
        issued_member_id varchar(10), -- FK
        issued_book_name Varchar (75),
        issued_date	date,
        issued_book_isbn varchar(30), -- FK
        issued_emp_id varchar(10) -- FK
	);

Drop table if exists return_status;
create table return_status
	(
		return_id varchar(10) primary key,
        issued_id	Varchar(10),
        return_book_name varchar(25),
        return_date	date,
        return_book_isbn varchar(20)
);

alter table issued_status
add constraint fk_members
foreign key (issued_member_id)
references members(member_id);

alter table issued_status
add constraint fk_books
foreign key (issued_book_isbn)
references books(isbn);

alter table issued_status
add constraint fk_employees
foreign key (issued_emp_id)
references employees(emp_id);

alter table employees
add constraint fk_branch
foreign key (branch_id)
references branch(branch_id);

alter table return_status
add constraint fk_issued_status
foreign key (issued_id)
references issued_status(issued_id);

INSERT INTO members(member_id, member_name, member_address, reg_date) 
VALUES
('C101', 'Alice Johnson', '123 Main St', '2021-05-15'),
('C102', 'Bob Smith', '456 Elm St', '2021-06-20'),
('C103', 'Carol Davis', '789 Oak St', '2021-07-10'),
('C104', 'Dave Wilson', '567 Pine St', '2021-08-05'),
('C105', 'Eve Brown', '890 Maple St', '2021-09-25'),
('C106', 'Frank Thomas', '234 Cedar St', '2021-10-15'),
('C107', 'Grace Taylor', '345 Walnut St', '2021-11-20'),
('C108', 'Henry Anderson', '456 Birch St', '2021-12-10'),
('C109', 'Ivy Martinez', '567 Oak St', '2022-01-05'),
('C110', 'Jack Wilson', '678 Pine St', '2022-02-25'),
('C118', 'Sam', '133 Pine St', '2024-06-01'),    
('C119', 'John', '143 Main St', '2024-05-01');

INSERT INTO branch(branch_id, manager_id, branch_address, contact_no) 
VALUES
('B001', 'E109', '123 Main St', '+919099988676'),
('B002', 'E109', '456 Elm St', '+919099988677'),
('B003', 'E109', '789 Oak St', '+919099988678'),
('B004', 'E110', '567 Pine St', '+919099988679'),
('B005', 'E110', '890 Maple St', '+919099988680');

INSERT INTO employees(emp_id, emp_name, position, salary, branch_id) 
VALUES
('E101', 'John Doe', 'Clerk', 60000.00, 'B001'),
('E102', 'Jane Smith', 'Clerk', 45000.00, 'B002'),
('E103', 'Mike Johnson', 'Librarian', 55000.00, 'B001'),
('E104', 'Emily Davis', 'Assistant', 40000.00, 'B001'),
('E105', 'Sarah Brown', 'Assistant', 42000.00, 'B001'),
('E106', 'Michelle Ramirez', 'Assistant', 43000.00, 'B001'),
('E107', 'Michael Thompson', 'Clerk', 62000.00, 'B005'),
('E108', 'Jessica Taylor', 'Clerk', 46000.00, 'B004'),
('E109', 'Daniel Anderson', 'Manager', 57000.00, 'B003'),
('E110', 'Laura Martinez', 'Manager', 41000.00, 'B005'),
('E111', 'Christopher Lee', 'Assistant', 65000.00, 'B005');

INSERT INTO books(isbn, book_title, category, rental_price, status, author, publisher) 
VALUES
('978-0-553-29698-2', 'The Catcher in the Rye', 'Classic', 7.00, 'yes', 'J.D. Salinger', 'Little, Brown and Company'),
('978-0-330-25864-8', 'Animal Farm', 'Classic', 5.50, 'yes', 'George Orwell', 'Penguin Books'),
('978-0-14-118776-1', 'One Hundred Years of Solitude', 'Literary Fiction', 6.50, 'yes', 'Gabriel Garcia Marquez', 'Penguin Books'),
('978-0-525-47535-5', 'The Great Gatsby', 'Classic', 8.00, 'yes', 'F. Scott Fitzgerald', 'Scribner'),
('978-0-141-44171-6', 'Jane Eyre', 'Classic', 4.00, 'yes', 'Charlotte Bronte', 'Penguin Classics'),
('978-0-307-37840-1', 'The Alchemist', 'Fiction', 2.50, 'yes', 'Paulo Coelho', 'HarperOne'),
('978-0-679-76489-8', 'Harry Potter and the Sorcerers Stone', 'Fantasy', 7.00, 'yes', 'J.K. Rowling', 'Scholastic'),
('978-0-7432-4722-4', 'The Da Vinci Code', 'Mystery', 8.00, 'yes', 'Dan Brown', 'Doubleday'),
('978-0-09-957807-9', 'A Game of Thrones', 'Fantasy', 7.50, 'yes', 'George R.R. Martin', 'Bantam'),
('978-0-393-05081-8', 'A Peoples History of the United States', 'History', 9.00, 'yes', 'Howard Zinn', 'Harper Perennial'),
('978-0-19-280551-1', 'The Guns of August', 'History', 7.00, 'yes', 'Barbara W. Tuchman', 'Oxford University Press'),
('978-0-307-58837-1', 'Sapiens: A Brief History of Humankind', 'History', 8.00, 'no', 'Yuval Noah Harari', 'Harper Perennial'),
('978-0-375-41398-8', 'The Diary of a Young Girl', 'History', 6.50, 'no', 'Anne Frank', 'Bantam'),
('978-0-14-044930-3', 'The Histories', 'History', 5.50, 'yes', 'Herodotus', 'Penguin Classics'),
('978-0-393-91257-8', 'Guns, Germs, and Steel: The Fates of Human Societies', 'History', 7.00, 'yes', 'Jared Diamond', 'W. W. Norton & Company'),
('978-0-7432-7357-1', '1491: New Revelations of the Americas Before Columbus', 'History', 6.50, 'no', 'Charles C. Mann', 'Vintage Books'),
('978-0-679-64115-3', '1984', 'Dystopian', 6.50, 'yes', 'George Orwell', 'Penguin Books'),
('978-0-14-143951-8', 'Pride and Prejudice', 'Classic', 5.00, 'yes', 'Jane Austen', 'Penguin Classics'),
('978-0-452-28240-7', 'Brave New World', 'Dystopian', 6.50, 'yes', 'Aldous Huxley', 'Harper Perennial'),
('978-0-670-81302-4', 'The Road', 'Dystopian', 7.00, 'yes', 'Cormac McCarthy', 'Knopf'),
('978-0-385-33312-0', 'The Shining', 'Horror', 6.00, 'yes', 'Stephen King', 'Doubleday'),
('978-0-451-52993-5', 'Fahrenheit 451', 'Dystopian', 5.50, 'yes', 'Ray Bradbury', 'Ballantine Books'),
('978-0-345-39180-3', 'Dune', 'Science Fiction', 8.50, 'yes', 'Frank Herbert', 'Ace'),
('978-0-375-50167-0', 'The Road', 'Dystopian', 7.00, 'yes', 'Cormac McCarthy', 'Vintage'),
('978-0-06-025492-6', 'Where the Wild Things Are', 'Children', 3.50, 'yes', 'Maurice Sendak', 'HarperCollins'),
('978-0-06-112241-5', 'The Kite Runner', 'Fiction', 5.50, 'yes', 'Khaled Hosseini', 'Riverhead Books'),
('978-0-06-440055-8', 'Charlotte''s Web', 'Children', 4.00, 'yes', 'E.B. White', 'Harper & Row'),
('978-0-679-77644-3', 'Beloved', 'Fiction', 6.50, 'yes', 'Toni Morrison', 'Knopf'),
('978-0-14-027526-3', 'A Tale of Two Cities', 'Classic', 4.50, 'yes', 'Charles Dickens', 'Penguin Books'),
('978-0-7434-7679-3', 'The Stand', 'Horror', 7.00, 'yes', 'Stephen King', 'Doubleday'),
('978-0-451-52994-2', 'Moby Dick', 'Classic', 6.50, 'yes', 'Herman Melville', 'Penguin Books'),
('978-0-06-112008-4', 'To Kill a Mockingbird', 'Classic', 5.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.'),
('978-0-553-57340-1', '1984', 'Dystopian', 6.50, 'yes', 'George Orwell', 'Penguin Books'),
('978-0-7432-4722-5', 'Angels & Demons', 'Mystery', 7.50, 'yes', 'Dan Brown', 'Doubleday'),
('978-0-7432-7356-4', 'The Hobbit', 'Fantasy', 7.00, 'yes', 'J.R.R. Tolkien', 'Houghton Mifflin Harcourt');

INSERT INTO issued_status(issued_id, issued_member_id, issued_book_name, issued_date, issued_book_isbn, issued_emp_id) 
VALUES
('IS106', 'C106', 'Animal Farm', '2024-03-10', '978-0-330-25864-8', 'E104'),
('IS107', 'C107', 'One Hundred Years of Solitude', '2024-03-11', '978-0-14-118776-1', 'E104'),
('IS108', 'C108', 'The Great Gatsby', '2024-03-12', '978-0-525-47535-5', 'E104'),
('IS109', 'C109', 'Jane Eyre', '2024-03-13', '978-0-141-44171-6', 'E105'),
('IS110', 'C110', 'The Alchemist', '2024-03-14', '978-0-307-37840-1', 'E105'),
('IS111', 'C109', 'Harry Potter and the Sorcerers Stone', '2024-03-15', '978-0-679-76489-8', 'E105'),
('IS112', 'C109', 'A Game of Thrones', '2024-03-16', '978-0-09-957807-9', 'E106'),
('IS113', 'C109', 'A Peoples History of the United States', '2024-03-17', '978-0-393-05081-8', 'E106'),
('IS114', 'C109', 'The Guns of August', '2024-03-18', '978-0-19-280551-1', 'E106'),
('IS115', 'C109', 'The Histories', '2024-03-19', '978-0-14-044930-3', 'E107'),
('IS116', 'C110', 'Guns, Germs, and Steel: The Fates of Human Societies', '2024-03-20', '978-0-393-91257-8', 'E107'),
('IS117', 'C110', '1984', '2024-03-21', '978-0-679-64115-3', 'E107'),
('IS118', 'C101', 'Pride and Prejudice', '2024-03-22', '978-0-14-143951-8', 'E108'),
('IS119', 'C110', 'Brave New World', '2024-03-23', '978-0-452-28240-7', 'E108'),
('IS120', 'C110', 'The Road', '2024-03-24', '978-0-670-81302-4', 'E108'),
('IS121', 'C102', 'The Shining', '2024-03-25', '978-0-385-33312-0', 'E109'),
('IS122', 'C102', 'Fahrenheit 451', '2024-03-26', '978-0-451-52993-5', 'E109'),
('IS123', 'C103', 'Dune', '2024-03-27', '978-0-345-39180-3', 'E109'),
('IS124', 'C104', 'Where the Wild Things Are', '2024-03-28', '978-0-06-025492-6', 'E110'),
('IS125', 'C105', 'The Kite Runner', '2024-03-29', '978-0-06-112241-5', 'E110'),
('IS126', 'C105', 'Charlotte''s Web', '2024-03-30', '978-0-06-440055-8', 'E110'),
('IS127', 'C105', 'Beloved', '2024-03-31', '978-0-679-77644-3', 'E110'),
('IS128', 'C105', 'A Tale of Two Cities', '2024-04-01', '978-0-14-027526-3', 'E110'),
('IS129', 'C105', 'The Stand', '2024-04-02', '978-0-7434-7679-3', 'E110'),
('IS130', 'C106', 'Moby Dick', '2024-04-03', '978-0-451-52994-2', 'E101'),
('IS131', 'C106', 'To Kill a Mockingbird', '2024-04-04', '978-0-06-112008-4', 'E101'),
('IS132', 'C106', 'The Hobbit', '2024-04-05', '978-0-7432-7356-4', 'E106'),
('IS133', 'C107', 'Angels & Demons', '2024-04-06', '978-0-7432-4722-5', 'E106'),
('IS134', 'C107', 'The Diary of a Young Girl', '2024-04-07', '978-0-375-41398-8', 'E106'),
('IS135', 'C107', 'Sapiens: A Brief History of Humankind', '2024-04-08', '978-0-307-58837-1', 'E108'),
('IS136', 'C107', '1491: New Revelations of the Americas Before Columbus', '2024-04-09', '978-0-7432-7357-1', 'E102'),
('IS137', 'C107', 'The Catcher in the Rye', '2024-04-10', '978-0-553-29698-2', 'E103'),
('IS138', 'C108', 'The Great Gatsby', '2024-04-11', '978-0-525-47535-5', 'E104'),
('IS139', 'C109', 'Harry Potter and the Sorcerers Stone', '2024-04-12', '978-0-679-76489-8', 'E105'),
('IS140', 'C110', 'Animal Farm', '2024-04-13', '978-0-330-25864-8', 'E102');

INSERT INTO return_status(return_id, issued_id, return_date) 
VALUES


('RS105', 'IS107', '2024-05-03'),
('RS106', 'IS108', '2024-05-05'),
('RS107', 'IS109', '2024-05-07'),
('RS108', 'IS110', '2024-05-09'),
('RS109', 'IS111', '2024-05-11'),
('RS110', 'IS112', '2024-05-13'),
('RS111', 'IS113', '2024-05-15'),
('RS112', 'IS114', '2024-05-17'),
('RS113', 'IS115', '2024-05-19'),
('RS114', 'IS116', '2024-05-21'),
('RS115', 'IS117', '2024-05-23'),
('RS116', 'IS118', '2024-05-25'),
('RS117', 'IS119', '2024-05-27'),
('RS118', 'IS120', '2024-05-29');

select * from branch;
select * from books;
select * from members;
select * from issued_status;

-- Task 1. Create a New Book Record**
-- "978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', Harper Lee', 'J.B. Lippincott & Co.')" 


INSERT INTO books(isbn, book_title, category, rental_price, status, author, publisher) 
VALUES ('978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.');


-- Task 2: Update an Existing Member's Address

UPDATE members
SET member_address = '125 Main St'
WHERE member_id ='C101';

-- Task 3: Delete a Record from the Issued Status Table
-- Objective: Delete the record with issued_id = 'IS121' from the issued_status table.

DELETE FROM issued_status
WHERE issued_id = 'IS121';


-- Task 4: Retrieve All Books Issued by a Specific Employee**
-- Objective: Select all books issued by the employee with emp_id = 'E101'

SELECT * 
FROM issued_status
WHERE issued_emp_id ='E101';

-- **Task 5: List Members Who Have Issued More Than One Book**
-- Objective: Use GROUP BY to find members who have issued more than one book.


SELECT issued_emp_id,
		count(issued_id) as Total_books_issued
FROM issued_status
GROUP BY issued_emp_id;

--CTAS (Create Table As Select)


-- Task 6: Create Summary Tables**: Used CTAS to generate new tables based on query results - each book and total book_issued_cnt
select * 
from books as b
join
issued_status as ist
on ist.issued_book_isbn = b.isbn;


Create table Book_cnts
as
select 
		b.isbn,
		b.book_title,
		Count (ist.issued_id) as no_issued
from books as b
join
issued_status as ist
on ist.issued_book_isbn = b.isbn
group by 1, 2;

select * from book_cnts;

--4. Data Analysis & Findings

--Task 7. **Retrieve All Books in a Specific Category


select * From books
WHERE category = 'Classic';

 --Task 8: Find Total Rental Income by Category


 select 
	b.category,
	SUM(b.rental_price),
	count(*)
from books as b
join
issued_status as ist
on ist.issued_book_isbn = b.isbn
group by 1;

-- TASK 9 *List Members Who Registered in the Last 180 Days**:

select * 
from members
where reg_date >= current_date - interval '180 days';

insert into members(member_id, member_name, member_address, reg_date)
values
('c115', 'Sam Weiss', '145 Main St', '2024-06-01'),
('c119', 'John Okel', '133 Sample St', '2024-05-01');

select current_date + interval '48 days'

-- Task 10. **List Employees with Their Branch Manager's Name and their branch details**:

select * from branch;
select e1,*,
		b.branch_id,
		e2.emp_name as manager	
from employees as e1
join
branch as b
on b.branch_id = e1.branch_id
join
employees as e2
on b.manager_id = e2.emp_id;
 
--Task 11 Create a Table of Books with Rental Price Above a Certain Threshold

create table  Bks_price_7up as
select * from books
where rental_price > 7;

-- Task 12: **Retrieve the List of Books Not Yet Returned**

select distinct ist.issued_book_name 
from issued_status as ist
left join
return_status as rs
on  ist.issued_id = rs.issued_id
where rs.return_id is null;




INSERT INTO issued_status(issued_id, issued_member_id, issued_book_name, issued_date, issued_book_isbn, issued_emp_id)
VALUES
('IS151', 'C118', 'The Catcher in the Rye', CURRENT_DATE - INTERVAL '24 days',  '978-0-553-29698-2', 'E108'),
('IS152', 'C119', 'The Catcher in the Rye', CURRENT_DATE - INTERVAL '13 days',  '978-0-553-29698-2', 'E109'),
('IS153', 'C106', 'Pride and Prejudice', CURRENT_DATE - INTERVAL '7 days',  '978-0-14-143951-8', 'E107'),
('IS154', 'C105', 'The Road', CURRENT_DATE - INTERVAL '32 days',  '978-0-375-50167-0', 'E101');

ALTER TABLE return_status
ADD Column book_quality VARCHAR(15) DEFAULT('Good');

UPDATE return_status
SET book_quality = 'Damaged'
WHERE issued_id 
    IN ('IS112', 'IS117', 'IS118');

SELECT * FROM books;
SELECT * FROM branch;
SELECT * FROM employees;
SELECT * FROM issued_status;
SELECT * FROM members;
SELECT * FROM return_status;


-- Task 13: Identify Members with Overdue books (assuming 30 days or more)
--issued_status == members == books ==retun_status


select ist.issued_member_id,
		m.member_name,
		bk.book_title,
		ist.issued_date,
		current_date - ist.issued_date as over_due_days
from issued_status as ist
join 
members as m
	on m.member_id = ist.issued_member_id
join 
books as bk
	on bk.isbn = ist.issued_book_isbn
left join 
return_status as rs
	on rs.issued_id = ist.issued_id
where 
	rs.return_date is null
	--and-
	(current_date - ist.issued_date)>30
order by 1


/* Task 14: Update Book Status on Return**  
Write a query to update the status of books in the 
books table to "Yes" when they are returned 
(based on entries in the return_status table).*/

SELECT * 
FROM books
WHERE isbn = '978-0-451-52994-2';

select * from issued_status
where issued_book_isbn = '978-0-451-52994-2'


select * from return_status
where issued_id = 'IS130';

insert into return_status(return_id, issued_id, return_date, book_quality)
values
('RS125', 'IS130', current_date, 'Good');
UPDATE books
SET status ='no'
WHERE isbn = '978-0-451-52994-2'


UPDATE books
SET status ='yes'
WHERE isbn = '978-0-451-52994-2';

-- STore Purchases

Create or replace procedure add_return_records(p_return_id Varchar(30), p_issued_id Varchar(15), p_book_quality Varchar(10) )
Language plpgsql
as $$

declare
	v_isbn varchar(50);
	v_book_name varchar(80);
begin
-- all logic and code
--inserting into returns based on user's input
insert into return_status(return_id, issued_id, return_date, book_quality)
values
(p_return_id, p_issued_id, current_date, p_book_quality);

select
	issued_book_isbn,
	Issued_book_name
	into
	v_isbn,
	v_book_name
from issued_status
where issued_id = p_issued_id;

UPDATE books
SET status ='yes'
WHERE isbn = v_isbn;

raise notice 'Thank you for returning the book %', v_book_name;
end;
$$


call add_return_records('Rs138', 'IS135','Good');

-- Testing Function
issued_id = IS135
isbn = 978-0-307-58837-1

select from return_status 
 where issued_id = 'is135';

select * 
from books
where isbn = '978-0-307-58837-1';

SELECT * FROM issued_status
WHERE issued_book_isbn = '978-0-307-58837-1';

SELECT * FROM return_status
WHERE issued_id = 'IS135';

/* *Task 15: Branch Performance Report**  
Create a query that generates a performance report for each branch, showing the number of books issued, 
the number of books returned, and the total revenue generated from book rentals */


Select * from branch;
select * From issued_status;
select * from employees;
select * from books;
select * from return_status;

CREATE TABLE branch_reports
AS
select b.branch_id,
		b.manager_id,
		Count(ist.issued_id) as number_book_issued,
		count(rs.return_id) as Number_of_book_returned,
		SUM(bk.rental_price) as total_revenue
from issued_status as ist
join
employees as e
on e.emp_id = ist.issued_emp_id
join 
branch as b
on e.branch_id = b.branch_id
left join
return_status as rs
on rs.issued_id = ist.issued_id
join 
books as bk
on ist.issued_book_isbn = bk.isbn
group by 1,2;

select * From branch_reports;



/**Task 16: CTAS: Create a Table of Active Members**  
Use the CREATE TABLE AS (CTAS) statement to create a new table active_members containing members 
who have issued at least one book in the last 2 months.*/

CREATE TABLE active_members
AS
select * from members
where member_id in (select 
					distinct(issued_member_id)
					from issued_status
					where 
						issued_date > current_date - interval '2 months'
						)
;

select * from active_members;

/**Task 17: Find Employees with the Most Book Issues Processed**  
Write a query to find the top 3 employees who have processed the most book issues. Display the employee name,
number of books processed, and their branch.*/

select  e.emp_name,
		b.*,
		count(ist.issued_id) as no_book_issued
		FROM issued_status as ist
join
employees as e
on e.emp_id = ist.issued_emp_id
join 
branch as b
on e.branch_id = b.branch_id
group by 1,2; 



/**Task 19: Stored Procedure**
Objective:
Create a stored procedure to manage the status of books in a library system.
Description:
Write a stored procedure that updates the status of a book in the library based on its issuance. The procedure should function as follows:
The stored procedure should take the book_id as an input parameter.
The procedure should check if the book is available (status = 'yes').
If the book is available, it should be issued, and the status in the books table should be updated to 'no'.
If the book is unavailable (status = 'no'), the procedure should return an error message indicating that the book is unavailable.*/

select * from books;
select * from issued_status;

CREATE or REPLACE PROCEDURE issued_book(p_issued_id VARCHAR(10), p_issued_member_id VARCHAR(30), p_issued_book_isbn VARCHAR(30), p_issued_emp_id VARCHAR(10))
LANGUAGE plpgsql
AS $$

DECLARE -- all variables here
	v_status Varchar(10);

BEGIN -- all the code
		-- Check if the book is available
	select 
		status
		into
		v_status
	from books
	where isbn = p_issued_book_isbn;

	IF V_status = 'yes' THEN

		INSERT into Issued_status(issued_id, issued_member_id, issued_date, Issued_book_isbn, issued_emp_id)
		Values
		(p_issued_id, p_issued_member_id, CURRENT_DATE, p_issued_book_isbn, p_issued_emp_id);

		Update books 
		set  status= 'no'
		where isbn = p_issued_book_isbn;

		Raise Notice 'Book records added successfully for book isbn: %', p_issued_book_isbn;

	ELSE--
		Raise Notice 'Sorry to inform you the book you requested is unavailable book_isbn: %', p_issued_book_isbn;


	END IF;


END;
$$

-- 978-0-553-29698-2 -'yes'
-- 978-0-375-41398-8-'no'
--

CALL issued_book('IS155', 'C108', '978-0-553-29698-2', 'E104');
CALL issue_book('IS156', 'C108', '978-0-375-41398-8', 'E104');

SELECT * FROM books
WHERE isbn = '978-0-553-29698-2';