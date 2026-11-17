
-- ============================================
-- 4. IPL DATA ANALYSIS QUERIES
-- ============================================

-- 1. Calculate the total number of IPL matches
-- played in each season.
-- GROUP BY groups matches by season.
-- COUNT() counts the matches in each season.

SELECT
    season,
    COUNT(*) AS total_matches
FROM matches
GROUP BY season
ORDER BY season;


-- 2. Calculate the total number of matches won
-- by each team across all IPL seasons.
-- Exclude NULL and empty winner values.
-- GROUP BY groups matches by winning team.

SELECT
    winner AS team,
    COUNT(*) AS total_wins
FROM matches
WHERE winner IS NOT NULL
  AND TRIM(winner) <> ''
GROUP BY winner
ORDER BY total_wins DESC;


-- 3. Calculate the total extra runs conceded
-- by each bowling team in IPL 2016.
-- JOIN connects matches and deliveries using match_id.
-- SUM() calculates the extra runs conceded by each team.

SELECT
    d.bowling_team AS team,
    SUM(d.extra_runs) AS total_extra_runs
FROM deliveries d
JOIN matches m
    ON d.match_id = m.id
WHERE m.season = 2016
GROUP BY d.bowling_team
ORDER BY total_extra_runs DESC;


-- 4. Identify the top 10 most economical bowlers
-- in IPL 2015.
-- Economy rate = Runs conceded / Overs bowled.
-- Exclude byes, leg-byes and penalty runs
-- from runs conceded.
-- Wides and no-balls are not counted as legal balls.
-- Consider bowlers who bowled at least 10 overs.

SELECT
    d.bowler,
    ROUND(
        (
            SUM(
                d.total_runs
                - d.bye_runs
                - d.legbye_runs
                - d.penalty_runs
            ) * 6.0
        ) /
        NULLIF(
            COUNT(*) FILTER (
                WHERE d.wide_runs = 0
                  AND d.noball_runs = 0
            ),
            0
        ),
        2
    ) AS economy
FROM matches m
JOIN deliveries d
    ON m.id = d.match_id
WHERE m.season = 2015
GROUP BY d.bowler
HAVING COUNT(*) FILTER (
    WHERE d.wide_runs = 0
      AND d.noball_runs = 0
) >= 60
ORDER BY economy ASC
LIMIT 10;
