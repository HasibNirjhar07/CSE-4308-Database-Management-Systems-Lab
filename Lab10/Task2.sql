SET SERVEROUTPUT ON SIZE 1000000;
SET VERIFY OFF;

--a--

-- a procedure to find the N top-rated movies and their details (Top-rated means top
--highest average rating). The procedure will take N as input and print the details up to
--N movies. If N is greater than the number of movies, then it will print an error message.

CREATE OR REPLACE PROCEDURE Top_Movies(N IN NUMBER) IS
    Movie_Count NUMBER;
  BEGIN
    SELECT COUNT(*)
    INTO Movie_Count
    FROM Movie;
  
    IF N > Movie_Count THEN
        DBMS_OUTPUT.PUT_LINE('Error: Limit Exceeds');
        RETURN;
    END IF;

    Movie_Count := 0;
    FOR movie_rating IN (
        SELECT m.mov_id, m.mov_title, NVL(AVG(r.rev_stars),0) as avg_rating
        FROM Movie m LEFT JOIN Rating r ON m.mov_id = r.mov_id
        GROUP BY m.mov_id, m.mov_title
        ORDER BY avg_rating DESC
    )
    LOOP
        DBMS_OUTPUT.PUT_LINE('Movie ID: ' || movie_rating.mov_id);
        DBMS_OUTPUT.PUT_LINE('Title: ' || movie_rating.mov_title);
        DBMS_OUTPUT.PUT_LINE('Average Rating: ' || ROUND(movie_rating.avg_rating, 2));
        DBMS_OUTPUT.PUT_LINE('------------------------');
        Movie_Count:= Movie_Count + 1;
        EXIT WHEN Movie_Count>= n;
    END LOOP;
END;
/

-- Calling it from an anonymous block
DECLARE
    N NUMBER;
BEGIN
    N:= '&N';
    Top_Movies(N);
END;
/


-- b

-- a function to find the movie status (“Solo”, “Ensemble”). If the total number of actors/actresses in a movie is 1, then the status should be “Solo”, else it should be “Ensemble”.

CREATE OR REPLACE
FUNCTION Movie_Status (movie_title VARCHAR2)
RETURN VARCHAR2
IS
act_count NUMBER;
BEGIN 
SELECT COUNT(c.ACT_ID) INTO act_count
FROM MOVIE m LEFT JOIN CASTS c ON m.MOV_ID= c.MOV_ID
GROUP BY m.MOV_ID, m.MOV_TITLE
HAVING m.MOV_TITLE = movie_title;

IF act_count= 0 THEN
    RETURN 'Not Found';
ELSIF act_count= 1 THEN
    RETURN 'Solo';
ELSE
    RETURN 'Ensemble';
END IF;

END ;
/

-- Calling it from an anonymous block

DECLARE
    title VARCHAR2(100);
BEGIN
    title:= '&title';
    DBMS_OUTPUT.PUT_LINE(movie_Status(title));
END;
/



--c--

-- a procedure to find the possible nominees for the Oscars.

CREATE OR REPLACE PROCEDURE Find_Oscar_Nominees
IS
    nominee_count NUMBER := 1;
BEGIN
    FOR nominee_names IN (
        SELECT DISTINCT d.DIR_FIRSTNAME || ' ' || d.DIR_LASTNAME AS NOMINEE_NAME
        FROM DIRECTOR d
        LEFT JOIN DIRECTION dir ON d.DIR_ID = dir.DIR_ID
        WHERE dir.MOV_ID IN (
            SELECT m.MOV_ID
            FROM MOVIE m
            LEFT JOIN RATING r ON m.MOV_ID = r.MOV_ID
            GROUP BY m.MOV_ID
            HAVING COUNT(r.REV_ID) > 10 AND AVG(r.REV_STARS) >= 7
        )
    )
    LOOP
        DBMS_OUTPUT.PUT_LINE('Nominee ' || nominee_count || ': ' || nominee_names.NOMINEE_NAME);
        nominee_count := nominee_count + 1;
    END LOOP;
END Find_Oscar_Nominees;
/


-- Calling it from an anonymous block

BEGIN
    Find_Oscar_Nominees;
END;
/


--d--

-- a function to find the category of a movie.
CREATE OR REPLACE FUNCTION movie_Category (movie_title VARCHAR2)
RETURN VARCHAR2
IS
    release_year NUMBER;
    avg_rating NUMBER;
BEGIN 
    SELECT m.mov_year, NVL(AVG(r.rev_stars), 0)
    INTO release_year, avg_rating
    FROM Movie m LEFT JOIN Rating r ON m.mov_id = r.mov_id
    WHERE m.MOV_TITLE = movie_title
    GROUP BY m.mov_id, m.mov_title, m.mov_year;

    IF (release_year >= 1950 AND release_year <= 1959 AND avg_rating > 6.5) THEN
        RETURN 'Fantastic Fifties';
    ELSIF (release_year >= 1960 AND release_year <= 1969 AND avg_rating > 6.7) THEN
        RETURN 'Sweet Sixties';
    ELSIF (release_year >= 1970 AND release_year <= 1979 AND avg_rating > 6.9) THEN
        RETURN 'Super Seventies';
    ELSIF (release_year >= 1980 AND release_year <= 1989 AND avg_rating > 7.1) THEN
        RETURN 'Ecstatic Eighties';
    ELSIF (release_year >= 1990 AND release_year <= 1999 AND avg_rating > 7.3) THEN
        RETURN 'Neat Nineties';
    ELSE
        RETURN 'Garbage';
    END IF;
END;
/

-- Calling it from an anonymous block

DECLARE
    title VARCHAR2(100);
BEGIN
    title:= '&title';
    DBMS_OUTPUT.PUT_LINE(movie_Category(title));
END;
/


