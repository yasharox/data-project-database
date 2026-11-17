# Data Project – SQL Version

## Project Overview

This project analyses Indian Premier League (IPL) match and ball-by-ball delivery data using MySQL.

The objective is to practise SQL queries, database creation, user permissions, CSV data import, joins, aggregation, and data analysis.

## Technologies Used

- MySQL
- SQL
- MySQL Workbench
- Git and GitHub

## Database Details

| Item | Value |
|---|---|
| Database | `IPL` |
| Database User | `workbench_user` |
| Table 1 | `matches` |
| Table 2 | `deliveries` |
| Database System | MySQL |

## Project Structure

```text
data-project-database/
│
├── 01_create_database.sql
├── 02_cleanup.sql
├── 03_load_csv.sql
├── 04_ipl_queries.sql
├── README.md
└── .gitignore
```

## IPL Analysis Tasks

The following questions are solved using SQL:

- Calculate the number of matches played per year across all IPL seasons.
- Calculate the number of matches won by each team across all IPL seasons.
- Calculate the extra runs conceded by each team in IPL 2016.
- Identify the top 10 most economical bowlers in IPL 2015.

## Database Setup and Execution

### Prerequisites

Install MySQL and ensure that the IPL CSV datasets are available locally.

Required CSV files:

- `matches.csv`
- `deliveries.csv`

### Step 1: Create Database and User

Run the following script using a MySQL administrator account:

```bash
mysql -u root -p < 01_create_database.sql
```

This creates the `workbench_user` account and the `IPL` database, and grants the required privileges to the user.

### Step 2: Load CSV Data

Update the CSV file paths inside `03_load_csv.sql` according to your local system.

Run:

```bash
mysql -u workbench_user -p IPL < 03_load_csv.sql
```

This creates the required tables and imports the CSV records.

### Step 3: Execute IPL Queries

Run:

```bash
mysql -u workbench_user -p IPL < 04_ipl_queries.sql
```

The queries display the required SQL result sets.

### Step 4: Clean Up

If the database and user need to be removed, connect as a MySQL administrator and run:

```bash
mysql -u root -p < 02_cleanup.sql
```

**Note:** The cleanup script permanently deletes the IPL database and its data.

## Expected Outcome

The project produces SQL result sets showing:

- Total matches played per IPL season.
- Total matches won by each team.
- Extra runs conceded by each bowling team in 2016.
- Top 10 economical bowlers in 2015.

## Author

Mohamed Yashar
