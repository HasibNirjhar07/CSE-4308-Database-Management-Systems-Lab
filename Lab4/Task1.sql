SELECT 
    ACT_FIRSTNAME,
    DIR_FIRSTNAME,
    ACT_LASTNAME,
    DIR_LASTNAME
FROM
    ACTOR,
    DIRECTOR    
WHERE
    ACT_FIRSTNAME = DIR_FIRSTNAME
    AND ACT_LASTNAME = DIR_LASTNAME;

--1. Find the name of the actors/actresses that are also directors (with set operator).
SELECT 
    ACT_FIRSTNAME,
    DIR_FIRSTNAME
FROM
   ACTOR,
    DIRECTOR
WHERE
    ACT_FIRSTNAME = DIR_FIRSTNAME
INTERSECT
SELECT 
    ACT_LASTNAME,
    DIR_LASTNAME
FROM
    ACTOR,
    DIRECTOR
WHERE
    ACT_LASTNAME = DIR_LASTNAME;

--2. Find the actresses with the same first name.
SELECT 
    ACT_FIRSTNAME,
    COUNT(*)  AS actresses
FROM
    ACTOR
WHERE
    ACT_GENDER = 'F'
GROUP BY ACT_FIRSTNAME
HAVING COUNT(*) > 1;

--3. Find the list of all the full names stored in the database.
SELECT 
    ACT_FIRSTNAME,
    ACT_LASTNAME
FROM
    ACTOR
UNION
SELECT 
    DIR_FIRSTNAME,
    DIR_LASTNAME
FROM
    DIRECTOR;

 --4. Find the movie titles that did not receive any ratings.

SELECT 
    MOV_TITLE
FROM
    MOVIE
WHERE
    MOV_ID NOT IN (SELECT 
            MOV_ID
        FROM
            RATING);

--5. Find the average rating of all movies.

SELECT 
    AVG(REV_STARS) AS average_rating
FROM
    RATING;

--6. Find the minimum rating for each movie and display them in descending order of rating.

SELECT 
    MOV_TITLE,
    MIN(REV_STARS) AS minimum_rating
FROM
    MOVIE
        JOIN
    RATING USING (MOV_ID)
GROUP BY MOV_TITLE
ORDER BY minimum_rating DESC;

--7. Find the title of the movie having an average rev_star higher than the average rev_star of all the movies.

SELECT 
    MOV_TITLE
FROM
    MOVIE
WHERE
    MOV_ID IN (SELECT 
            MOV_ID
        FROM
            RATING
        GROUP BY MOV_ID
        HAVING AVG(REV_STARS) > (SELECT 
                AVG(REV_STARS)
            FROM
                RATING));

--8. Find the name of actors/actresses and the number of ratings received by the movies in which they played a role.     

SELECT 
    ACT_FIRSTNAME,
    ACT_LASTNAME,
    COUNT(*) AS number_of_ratings
FROM
  ACTOR,
  CASTS,
    RATING
WHERE
    ACTOR.ACT_ID = CASTS.ACT_ID
        AND CASTS.MOV_ID = RATING.MOV_ID
GROUP BY ACT_FIRSTNAME , ACT_LASTNAME
ORDER BY number_of_ratings DESC;

--9. Find the name of the director of the movie having the highest average rev_star.

SELECT 
    DIR_FIRSTNAME,
    DIR_LASTNAME
FROM
    DIRECTOR
WHERE
    DIR_ID IN (SELECT 
            DIR_ID
        FROM
            MOVIE
                JOIN
            RATING USING (MOV_ID)
        GROUP BY DIR_ID
        HAVING AVG(REV_STARS) = (SELECT 
                MAX(AVG(REV_STARS))
            FROM
                MOVIE
                    JOIN
                RATING USING (MOV_ID)
            GROUP BY DIR_ID));

--10. Find all the movie-related information of movies acted and directed by the same person.

SELECT
    MOV_TITLE,
    MOV_YEAR,
    MOV_LANGUAGE,
    MOV_RELEASEDATE,
    MOV_COUNTRY
FROM
    MOVIE
WHERE
    MOV_ID IN (
        SELECT
            MOV_ID
        FROM
            CASTS
        WHERE
            ACT_ID IN (
                SELECT
                    ACT_ID
                FROM
                    ACTOR
                WHERE
                    ACT_FIRSTNAME = (
                        SELECT
                            DIR_FIRSTNAME
                        FROM
                            DIRECTOR
                        WHERE
                            DIR_FIRSTNAME = ACT_FIRSTNAME
                            AND DIR_LASTNAME = ACT_LASTNAME
                    )
                    AND ACT_LASTNAME = (
                        SELECT
                            DIR_LASTNAME
                        FROM
                            DIRECTOR
                        WHERE
                            DIR_FIRSTNAME = ACT_FIRSTNAME
                            AND DIR_LASTNAME = ACT_LASTNAME
                    )
            )
    );



-- TASK 12
SELECT
    REV_ID,
    REV_NAME
FROM
    REVIEWER
WHERE
    REVIEWER.REV_ID IN (
        SELECT
            REV_ID
        FROM
            RATING
        WHERE
            REV_STARS = (
                SELECT
                    MIN(REV_STARS)
                FROM
                    RATING
            )
    );           






    