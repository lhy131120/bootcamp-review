CREATE DATABASE bootcamp_exercise4;
use bootcamp_exercise4;

CREATE TABLE players(
  player_id INTEGER NOT NULL UNIQUE,
  group_id INTEGER NOT NULL
);

CREATE TABLE matches(
  match_id INTEGER NOT NULL UNIQUE,
  first_player INTEGER NOT NULL,
  second_player INTEGER NOT NULL,
  first_score INTEGER NOT NULL,
  second_score INTEGER NOT NULL
);

INSERT INTO players VALUES 
  (20, 2),
  (30, 1),
  (40, 3),
  (45, 1),
  (50, 2),
  (65, 1);

INSERT INTO matches VALUES
  (1,30,45,10,12),
  (2,20,50,5,5),
  (13,65,45,10,10),
  (5,30,65,3,15),
  (42,45,65,8,4);

SELECT * FROM players;
SELECT * FROM matches;

-- You would like to compute the winner in each group. 
-- The winner in each group is the player who scored the maximum total number of points within the group. If there is more than one such player, the winner is the one with the lowest ID.
-- Write an SQL query that returns a table containing the winner of each group. 

-- Assumption:
-- Groups are numbered with consecutive integers beginning from 1;
-- Every player from table matches occurs in table players;
-- In each match, players belong to the same group;
-- The score is a value between 0 and 1000000;
-- There is at most 100 players;
-- There is at most 100 matches.

-- In group 1, the winner is player 45 with the total score of 30 points.
-- In group 2, both players scored 5 points, but player 20 has lower ID and is a winner. 
-- In group 3, there is only one player, and although she didn't play any matches, she is the winner.

WITH player_scores AS (
  -- get each player total score
  SELECT 
    p.player_id,
    p.group_id,
    COALESCE(SUM(
      CASE 
        WHEN p.player_id = m.first_player THEN m.first_score
        WHEN p.player_id = m.second_player THEN m.second_score
        ELSE 0
      END), 0) AS total_score
  FROM players p
  LEFT JOIN matches m
    ON p.player_id = m.first_player OR p.player_id = m.second_player
  GROUP BY p.player_id, p.group_id
),
group_winners AS (
  -- get each group the highest sorce
  SELECT 
    group_id,
    MAX(total_score) AS max_score
  FROM player_scores
  GROUP BY group_id
),
final_winners AS (
  -- if same score on the group, get lower ID for winner
  SELECT 
    ps.group_id,
    ps.player_id,
    ps.total_score
  FROM player_scores ps
  JOIN group_winners gw
    ON ps.group_id = gw.group_id
    AND ps.total_score = gw.max_score
)
SELECT 
  group_id,
  MIN(player_id) AS winner_id,
  total_score
FROM final_winners
GROUP BY group_id
ORDER BY group_id;
