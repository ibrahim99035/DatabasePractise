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
- All book **_must_** have author (Full Participation).
- All author **_must_** have books (Full Participation).