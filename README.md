# Database Design Practise

This Repo is my personal approval that I can design, implement, and integrate databases, and I will continue developing every database in the repo.

---

I had used ChatGPT to generate the tasks, and I had used Lucid Spark to create the ER Diagram.

---

## Case 1: Library Management System

**The system needs to track books, authors, and borrowers.**

### Entity 1: Books:

|   Field  |   Data Type  |    key    |    Constraints    |  Attribute Type |                 Description                |
|--------|------------|---------|-----------------|---------------|------------------------------------------|
| ISBN     |  VARCHAR(13) |  Primary  | Unique - Not Null | Simple - Single | Unique International Standard Book Number. |
| Title    | VARCHAR(100) | Candidate | Unique - Not Null | Simple - Single | The Book Title.                            |
| PubYear  |      INT     |     NO    |      Not Null     | Simple - Single | The Year of Publication.                   |
| AuthorID |      INT     |  Foreign  | Unique - Not Null | Simple - Single | Foreign Key to Authors Table.              |

### Entity 2: Authors:

| Field | Data Type | key       | Constraints       | Attribute Type  | Description          |
|-------|-----------|-----------|-------------------|-----------------|----------------------|
| Name  | VARCHAR() | Candidate | Unique - Not Null | Simple - Single | Name of the author.  |
| ID    | INT       | Primary   | Unique - Not Null | Simple - Single | Unique identifier.   |

### Entity 3: Borrowers:

| Field       | Data Type    | key       | Constraints       | Attribute Type  | Description                  |
|-------------|--------------|-----------|-------------------|-----------------|------------------------------|
| ID          | INT          | Primary   | Unique - Not Null | Simple - Single | Unique Identifier.           |
| FirstName   | VARCHAR(50)  | No        | Not Null | Composite       | First Name.                  |
| LastName    | VARCHAR(50)  | No        | Not Null | Composite       | Last Name.                   |
| ContactInfo | VARCHAR(100) | Candidate | Unique - Not Null | Simple - Single | Contact Information.         |
| BookISBN    | VARCHAR(13)  | Foreign   | Unique - Not Null | Simple - Single | Foreign Key for Books table. |

---
> There are nither Multi-Valued attributes nor Drived.
---

### Relationship 1: Work (Book - Author):

- Binary relationship between the authors and their books.
- One auther can write Many books but, any book has one author (One-To-Many).
- All books **_must_** have author (Full Participation).
- All authors **_must_** have books (Full Participation).

### Relationship 2: Borrow (Book - Borrower):

- Binary relationship between the borrower and the books.
- One borrower can borrow Many books but, any book has one borrower (One-To-Many).
- Any book **_may_** has borrower (Partial Participation).
- All borrowers **_must_** have books (Full Participation).

### Library ERD: 

**Lucid Spark used to create this ERD.**

![ERD](https://github.com/ibrahim99035/DatabasePractise/blob/7998c4cf1a5dc77fe6edaac9aff2a26a85564e67/Library%20Management%20System/Library%20ERD.png)

### Library DB Logical Design: 

![LogicalDesign](https://github.com/ibrahim99035/DatabasePractise/blob/621a2acea87e17abfc29b24c105197c248c0785c/Library%20Management%20System/dbdiagramio.PNG)

**MySQL Workbench, MySQL on XAMPP, and dbdiagram.io had been used to Create This Logical Schema.**

### MySQL Syntax:

```sql
CREATE SCHEMA `mydb`;

CREATE TABLE `mydb`.`Author` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(100) NOT NULL
);

CREATE TABLE `mydb`.`Book` (
  `ISBN` VARCHAR(13) PRIMARY KEY NOT NULL,
  `Title` VARCHAR(100) NOT NULL,
  `PubYear` INT NOT NULL,
  `AuthorID` INT NOT NULL
);

CREATE TABLE `mydb`.`Borrower` (
  `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `FirstName` VARCHAR(50) NOT NULL,
  `LastName` VARCHAR(50) NOT NULL,
  `ContactInfo` VARCHAR(100) NOT NULL,
  `BookISBN` VARCHAR(13) NOT NULL
);


ALTER TABLE `mydb`.`Book` ADD CONSTRAINT `id` FOREIGN KEY (`AuthorID`) REFERENCES `mydb`.`Author` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE `mydb`.`Borrower` ADD CONSTRAINT `ISBN` FOREIGN KEY (`BookISBN`) REFERENCES `mydb`.`Book` (`ISBN`) ON DELETE NO ACTION ON UPDATE NO ACTION;

```

