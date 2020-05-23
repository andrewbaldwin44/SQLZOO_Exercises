--Question 1
SELECT id, title
FROM movie
WHERE yr = 1962

--Question 2
SELECT yr
FROM movie
WHERE title = 'Citizen Kane'

--Question 3
SELECT id, title, yr
FROM movie
WHERE title LIKE '%Star Trek%'

--Question 4
SELECT id
FROM actor
WHERE name = 'Glenn Close'

--Question 5
SELECT id
FROM movie
WHERE title = 'Casablanca'

--Question 6
SELECT name
FROM actor JOIN casting ON id = casting.actorid JOIN movie ON movieid = movie.id
WHERE title = 'Casablanca'

--Question 7
SELECT name
FROM actor
     JOIN casting ON id = casting.actorid
     JOIN movie ON movieid = movie.id
WHERE title = 'Alien'

--Question 8
SELECT title
FROM movie
     JOIN casting ON id = casting.movieid
     JOIN actor ON actorid = actor.id
WHERE name = 'Harrison Ford'

--Question 9
SELECT title
FROM movie
     JOIN casting ON id = casting.movieid
     JOIN actor ON actorid = actor.id
WHERE name = 'Harrison Ford' AND casting.ord <> 1

--Question 10
SELECT title, name
FROM movie
JOIN casting
ON id = casting.movieid
JOIN actor
ON actorid = actor.id
WHERE ord = 1 AND yr = 1962

--Question 11
SELECT yr,COUNT(title)
FROM movie
JOIN casting ON movie.id = movieid
JOIN actor   ON actorid = actor.id
WHERE name = 'Doris Day'
GROUP BY yr
HAVING COUNT(title) > 1

--Question 12
SELECT title, name
FROM movie
     JOIN casting ON movie.id = movieid
     JOIN actor ON actorid = actor.id
WHERE movie.id IN (SELECT casting.movieid
                   FROM casting
                   WHERE actorid = (SELECT id
                                    FROM actor
                                    WHERE name = 'Julie Andrews'))
                                    AND ord = 1

--Question 13
SELECT name
FROM actor
JOIN casting ON id = casting.actorid
WHERE ord = 1
GROUP BY name
HAVING COUNT(name) >= 15
ORDER BY name

--Question 14
SELECT title, COUNT(name)
FROM movie
JOIN casting ON id = casting.movieid
JOIN actor ON actorid = actor.id
WHERE  movie.yr = 1978
GROUP BY title
ORDER BY COUNT(actor.name) DESC, movie.title

--Question 15
SELECT name
FROM actor
JOIN casting ON id = casting.actorid
WHERE movieid IN
             (SELECT movieid
              FROM casting
              WHERE actorid =
                             (SELECT id
                              FROM actor
                              WHERE name = 'Art Garfunkel'))
                              AND name <> 'Art Garfunkel'
ORDER BY name
