
-- ============================================
-- 3. CREATE TABLES AND LOAD CSV DATA
-- ============================================

-- Select the IPL database.
USE IPL;

-- Create the matches table.
CREATE TABLE IF NOT EXISTS matches (
    id INT PRIMARY KEY,
    season INT,
    city VARCHAR(100),
    match_date DATE,
    team1 VARCHAR(100),
    team2 VARCHAR(100),
    toss_winner VARCHAR(100),
    toss_decision VARCHAR(20),
    result VARCHAR(50),
    dl_applied INT,
    winner VARCHAR(100),
    win_by_runs INT,
    win_by_wickets INT,
    player_of_match VARCHAR(100),
    venue VARCHAR(200),
    umpire1 VARCHAR(100),
    umpire2 VARCHAR(100),
    umpire3 VARCHAR(100)
);

-- Create the deliveries table.
CREATE TABLE IF NOT EXISTS deliveries (
    match_id INT,
    inning INT,
    batting_team VARCHAR(100),
    bowling_team VARCHAR(100),
    over_num INT,
    ball INT,
    batsman VARCHAR(100),
    non_striker VARCHAR(100),
    bowler VARCHAR(100),
    is_super_over INT,
    wide_runs INT,
    bye_runs INT,
    legbye_runs INT,
    noball_runs INT,
    penalty_runs INT,
    batsman_runs INT,
    extra_runs INT,
    total_runs INT,
    player_dismissed VARCHAR(100) NULL,
    dismissal_kind VARCHAR(50) NULL,
    fielder VARCHAR(100) NULL,

    FOREIGN KEY (match_id) REFERENCES matches(id)
);

-- Load matches data from the CSV file.
-- Empty values are converted to NULL.
LOAD DATA LOCAL INFILE
'/home/yash/Desktop/misc/matches.csv'
INTO TABLE matches
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(id, season, city, @v_date, team1, team2,
 toss_winner, toss_decision, result, dl_applied,
 winner, win_by_runs, win_by_wickets,
 player_of_match, venue, umpire1, umpire2, umpire3)
SET match_date = STR_TO_DATE(@v_date, '%Y-%m-%d');

-- Load deliveries data from the CSV file.
-- Empty values are converted to NULL using NULLIF().
-- The CSV column "over" is stored as over_num.

LOAD DATA LOCAL INFILE
'/home/yash/Desktop/misc/deliveries.csv'
INTO TABLE deliveries
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(match_id, inning, batting_team, bowling_team,
 @v_over, ball, batsman, non_striker, bowler,
 is_super_over, wide_runs, bye_runs, legbye_runs,
 noball_runs, penalty_runs, batsman_runs, extra_runs,
 total_runs, @v_player_dismissed,
 @v_dismissal_kind, @v_fielder)
SET
    over_num = NULLIF(@v_over, ''),
    player_dismissed = NULLIF(@v_player_dismissed, ''),
    dismissal_kind = NULLIF(@v_dismissal_kind, ''),
    fielder = NULLIF(@v_fielder, '');


-- Display sample records.
SELECT * FROM matches LIMIT 10;

SELECT * FROM deliveries LIMIT 10;
