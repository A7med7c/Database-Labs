# Database Labs 🗄️

A comprehensive collection of database design and SQL laboratories covering fundamental to advanced topics using T-SQL (Transact-SQL).

## 📋 Overview

This repository contains hands-on labs and exercises designed to teach database concepts, from basic SQL queries to advanced database design and optimization techniques. The labs are organized by day, with each day building upon previous concepts.

## 🎯 Topics Covered

### Database Design
- Entity-Relationship Diagrams (ERD)
- Enhanced Entity-Relationship Diagrams (EERD)
- Database normalization (1NF, 2NF, 3NF, BCNF)
- Schema design best practices
- Database mapping and modeling
- Relationships (One-to-One, One-to-Many, Many-to-Many)
- Primary and Foreign Keys
- Indexing strategies

### SQL Basics
- **Data Definition Language (DDL)**
  - CREATE, ALTER, DROP statements
  - Table creation and modification
  - Constraints (PRIMARY KEY, FOREIGN KEY, UNIQUE, CHECK, DEFAULT)

- **Data Manipulation Language (DML)**
  - SELECT queries
  - INSERT, UPDATE, DELETE operations
  - WHERE clause and filtering
  - ORDER BY and sorting
  - DISTINCT values
  - Bulk Insert operations
  - Insert based on SELECT
  - DML operations on Joins

- **Data Query Language (DQL)**
  - SELECT statements
  - Filtering and sorting
  - Query execution order

- **Basic Functions**
  - Aggregate functions (COUNT, SUM, AVG, MIN, MAX)
  - String functions
  - Date and time functions
  - Mathematical functions

### Advanced SQL Topics
- **Joins**
  - INNER JOIN
  - LEFT/RIGHT/FULL OUTER JOIN
  - CROSS JOIN
  - SELF JOIN

- **Subqueries**
  - Scalar subqueries
  - Correlated subqueries
  - EXISTS and NOT EXISTS
  - IN and NOT IN operators

- **Advanced Queries**
  - GROUP BY and HAVING clauses
  - Window functions (ROW_NUMBER, RANK, DENSE_RANK, NTILE)
  - Common Table Expressions (CTEs)
  - Recursive CTEs
  - PIVOT and UNPIVOT
  - TOP clause

- **Database Objects**
  - Views
  - Stored Procedures
  - Functions (Scalar and Table-Valued)
  - Triggers (DML Triggers)
  - Indexes (Clustered and Non-Clustered)
  - Synonyms
  - Cursors

- **Transactions & Administration**
  - ACID properties
  - BEGIN TRANSACTION, COMMIT, ROLLBACK
  - Transaction isolation levels
  - Locking and concurrency
  - Database administration basics

- **Performance Optimization**
  - Query optimization
  - Execution plans
  - Index optimization
  - Query hints

## 🚀 Getting Started

### Prerequisites
- SQL Server or Azure SQL Database
- SQL Server Management Studio (SSMS) or Azure Data Studio
- Basic understanding of relational databases

### Setup
1. Clone this repository
```bash
git clone https://github.com/A7med7c/Database-Labs.git
```

2. Open SQL Server Management Studio or Azure Data Studio

3. Navigate to the lab folders and execute the scripts in order (Day1 → Day10)

## 📁 Repository Structure

```
Database-Labs/
├── Day1/   # Database History & Design
├── Day2/   # Database Mapping and Creating new DB using SQL
├── Day3/   # DB Normalization & Enhanced ERD
├── Day4/   # Joins & Grouping & EERD
├── Day5/   # Normalization & Joins & Sub Query
├── Day6/   # Ranking Functions & Bulk Insert
├── Day7/   # Synonym & DML On Joins
├── Day8/   # Functions
├── Day9/   # Views & Transactions & Stored Procedures & Triggers
└── Day10/  # Cursor & DB Administration
```

## 💡 Usage

Each lab folder contains:
- **Instructions**: Step-by-step guide for the lab
- **Scripts**: T-SQL scripts to execute
- **Sample Data**: Test data for practice
- **Solutions**: Solutions to lab exercises (when applicable)

## 📝 Learning Path

1. **Day 1-2**: Start with database design principles, history, and mapping
2. **Day 3-4**: Master normalization techniques and ERD/EERD concepts
3. **Day 4-5**: Progress to joins, subqueries, and grouping
4. **Day 6**: Learn ranking functions and bulk operations
5. **Day 7**: Understand synonyms and DML operations on joins
6. **Day 8**: Explore user-defined functions
7. **Day 9**: Work with views, transactions, stored procedures, and triggers
8. **Day 10**: Master cursors and database administration

## 📊 Recent Updates

### Latest Commits
- **Cursor & DB Administration** - Advanced database administration concepts (2026-01-11)
- **Stored Procedures & Triggers** - Creating and managing stored procedures and triggers (2026-01-11)
- **Views & Transactions** - Working with views and transaction management (2026-01-11)
- **Functions** - User-defined functions (scalar and table-valued) (2026-01-11)
- **Synonym & DML On Joins** - Creating synonyms and DML operations (2026-01-11)
- **Ranking Functions & Bulk Insert** - Window functions and data import (2026-01-11)
- **Normalization & Joins & Sub Query** - Database normalization and query techniques (2026-01-11)
- **Database Design Fundamentals** - Initial labs on database theory and design (2026-01-11)

## 🤝 Contributing

Contributions are welcome! If you have additional labs, exercises, or improvements:

1. Fork the repository
2. Create a new branch (`git checkout -b feature/new-lab`)
3. Commit your changes (`git commit -m 'Add new lab on topic X'`)
4. Push to the branch (`git push origin feature/new-lab`)
5. Open a Pull Request

## 📚 Resources

- [Eng-Ramy Abou-Nagi](https://www.linkedin.com/in/ramy-abou-nagi-057158a7/)
- [Microsoft SQL Server Documentation](https://docs.microsoft.com/en-us/sql/)
- [T-SQL Reference](https://docs.microsoft.com/en-us/sql/t-sql/)
- [SQL Server Management Studio](https://docs.microsoft.com/en-us/sql/ssms/)

## 📄 License

This project is open source and available for educational purposes.

## 👤 Author

**A7med7c**
- GitHub: [@A7med7c](https://github.com/A7med7c)

## ⭐ Show Your Support

If you find these labs helpful, please give this repository a star!

---

*Happy Learning! 🎓*
