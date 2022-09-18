-- write your queries here

--part one:
SELECT * FROM owners o FULL JOIN vehicles v ON o.id = v.owner_id;

-- COUNT THE VEHICLES GROUP BY FIRST NAME LAST NAME AND ORDER BY FIRST NAME
SELECT first_name, last_name, COUNT(owner_id) as count FROM owners o JOIN 
vehicles v ON o.id = v.owner_id GROUP BY (first_name, last_name) ORDER BY
first_name ;

-- count the no. of cars for each owner and display the avg price
SELECT first_name, last_name, COUNT(owner_id), ROUND(AVG(price)) FROM owners o
JOIN vehicles v ON o.id = v.owner_id GROUP BY (first_name, last_name)
HAVING COUNT(owner_id) > 1 AND ROUND(AVG(price)) > 10000 ORDER BY first_name DESC;

-- SQL ZOO 6:
--1
SELECT matchid, player FROM goal 
  WHERE teamid = 'GER';
--2
SELECT id, stadium, team1, team2 FROM game WHERE id = 1012;
--3
SELECT player, teamid,stadium, mdate FROM game g 
JOIN goal go ON g.id = go.matchid WHERE teamid = 'GER';
--4
SELECT team1, team2, player FROM game g JOIN goal go 
ON (g.id = go.matchid) WHERE player LIKE'Mario%';
--5
SELECT player, teamid, coach, gtime
  FROM goal JOIN eteam ON goal.teamid = eteam.id 
 WHERE gtime<=10;
--6
SELECT mdate, teamname FROM game JOIN eteam ON 
game.team1 = eteam.id WHERE coach = 'Fernando Santos';
--7
SELECT player FROM game JOIN goal ON game.id = 
goal.matchid WHERE stadium = 'National Stadium, Warsaw';
--8
SELECT DISTINCT player
FROM game
JOIN goal ON goal.matchid = game.id
WHERE (team1 = 'GER' OR team2 = 'GER')
AND teamid <> 'GER';
--9
SELECT teamname, COUNT(player) as goals_scored FROM eteam JOIN goal
ON eteam.id = goal.teamid GROUP BY teamname;
--10
SELECT stadium, COUNT(player) as goals_scored FROM game JOIN goal 
ON game.id = goal.matchid GROUP BY stadium;
--11
SELECT matchid, mdate, COUNT(player)
FROM goal
JOIN game ON goal.matchid = game.id
WHERE (team1 = 'POL' OR team2 = 'POL')
GROUP BY goal.matchid, game.mdate;
--12
SELECT matchid, mdate, COUNT(player) FROM goal JOIN game 
ON goal.matchid = game.id WHERE (teamid = 'GER') 
GROUP BY goal.matchid, game.mdate;
--13
SELECT mdate,
  team1,
  SUM(CASE WHEN teamid=team1 THEN 1 ELSE 0 END) score1,
  team2,
  SUM(CASE WHEN teamid=team2 THEN 1 ELSE 0 END) score2
FROM game LEFT JOIN goal ON goal.matchid = game.id
GROUP BY game.id,mdate, matchid, team1, team2;

