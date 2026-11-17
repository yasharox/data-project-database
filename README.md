# Data Project – SQL Version

## Project Overview

This project analyses IPL match and ball-by-ball delivery data using SQL and PostgreSQL.

## Database Details

- Database name: `ipl`
- Database user: `ipl_user`
- Tables: `matches` and `deliveries`
- Database system: PostgreSQL

## Files

- `database_setup.sql` – Creates the PostgreSQL user and database.
- `load_data.sql` – Creates tables and loads IPL CSV data.
- `ipl_queries.sql` – Contains SQL queries to solve IPL problems.
- `cleanup.sql` – Deletes the database and user after completion.
- `README.md` – Project documentation.
- `.gitignore` – Ignores unnecessary files.

## How to Run

1. Open PostgreSQL using psql or pgAdmin.
2. Run the following command to create the database and user:

```bash
psql -U postgres -f database_setup.sql
```

3. Connect to the IPL database:

```bash
psql -U ipl_user -d ipl
```

4. Run the data-loading script:

```bash
psql -U ipl_user -d ipl -f load_data.sql
```

5. Run the IPL analysis queries:

```bash
psql -U ipl_user -d ipl -f ipl_queries.sql
```

6. After completing the project, run the cleanup script:

```bash
psql -U postgres -f cleanup.sql
```

## Important Note

Update the CSV file paths inside `load_data.sql` according to your own system before running the project.

## IPL Problems Solved

1. Number of matches played per year in IPL.
2. Number of matches won by each team across all IPL seasons.
3. Extra runs conceded by each team in IPL 2016.
4. Top 10 most economical bowlers in IPL 2015.
