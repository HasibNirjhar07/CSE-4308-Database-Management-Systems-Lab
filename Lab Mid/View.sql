Create VIEW ComicRating AS
SELECT
    Comics.comic_id,
    Comics.comic_title,
    COUNT(feedback.rating) AS Average_rating
From 
    Comics left JOIN feedback on Comics.comic_id=feedback.comic_id
GROUP_BY Comics.comic_id, Comics.comic_title;        