--Question 1
SELECT lastName, party, votes
FROM ge
WHERE constituency = 'S14000024' AND yr = 2017
ORDER BY votes DESC

--Question 2
SELECT party, votes,
       RANK() OVER (ORDER BY votes DESC) as posn
FROM ge
WHERE constituency = 'S14000024' AND yr = 2017
ORDER BY party

--Question 3
SELECT yr, party, votes,
      RANK() OVER (PARTITION BY yr ORDER BY votes DESC) as posn
FROM ge
WHERE constituency = 'S14000021'
ORDER BY party, yr

--Question 4
SELECT constituency, party, votes,
       RANK() OVER (PARTITION BY constituency ORDER BY votes DESC) as posn
FROM ge
WHERE constituency BETWEEN 'S14000021' AND 'S14000026'
      AND yr  = 2017
ORDER BY posn, constituency

--Question 5
SELECT constituency, party
FROM (SELECT constituency, party, votes,
             RANK() OVER (
                    PARTITION BY constituency
                    ORDER BY votes DESC
             ) edinburgh
     FROM ge
     WHERE constituency BETWEEN 'S14000021'
     AND 'S14000026'
     AND yr = 2017) temp
WHERE edinburgh = 1;

--Question 6
SELECT party, COUNT(constituency) seats
FROM (SELECT constituency, party, votes,
             RANK() OVER (
                    PARTITION BY constituency
                    ORDER BY votes DESC
             ) edinburgh
     FROM ge
     WHERE constituency LIKE 'S%' and yr = '2017') temp
WHERE edinburgh = 1
GROUP BY party
