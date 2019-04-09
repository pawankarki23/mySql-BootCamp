
-- printing all series title and corresponding ratings
SELECT series.title, reviews.rating from series 
INNER JOIN reviews ON series.id = reviews.series_id;

-- get average ratings per title
SELECT series.id, series.title, avg(reviews.rating) as average from series 
INNER JOIN reviews ON series.id = reviews.series_id
GROUP BY series.id
ORDER BY average;

-- get reviewers and their ratings

SELECT reviewers.first_name,reviewers.last_name,reviews.rating from reviewers 
INNER JOIN reviews ON reviewers.id = reviews.reviewer_id;

-- get unreviewed series

SELECT series.title from series 
LEFT JOIN reviews ON series.id = reviews.series_id
WHERE reviews.rating IS NULL;

-- genre and avg_ratings
SELECT series.genre, avg(reviews.rating) as average from series 
INNER JOIN reviews ON series.id = reviews.series_id
GROUP BY series.genre
ORDER BY average;

-- reviewer stat

SELECT first_name, 
       last_name, 
       Count(rating)                    AS COUNT, 
       Ifnull(Min(rating), 0)           AS MIN, 
       Ifnull(Max(rating), 0)           AS MAX, 
       Round(Ifnull(Avg(rating), 0), 2) AS AVG, 
       CASE 
         WHEN Count(rating) >= 10 THEN 'POWER USER' 
         WHEN Count(rating) > 0 THEN 'ACTIVE' 
         ELSE 'INACTIVE' 
       end                              AS STATUS 
FROM   reviewers 
       LEFT JOIN reviews 
              ON reviewers.id = reviews.reviewer_id 
GROUP  BY reviewers.id;

-- all table together

SELECT 
    title,
    rating,
    CONCAT(first_name,' ', last_name) AS reviewer
FROM reviewers
INNER JOIN reviews 
    ON reviewers.id = reviews.reviewer_id
INNER JOIN series
    ON series.id = reviews.series_id
ORDER BY title;