--b)

SELECT Writer.writer_id, Writer.w_name,
COUNT(feedback.rating) AS total_ratings
FROM writer
left JOIN
feedback on writer.writer_id=feedback.comic_id
GROUP_BY writer.writer_id, writer.w_name
Having AVG(feedback.rating)<(
    select avg(rating)
    from feedback
)
order by total_ratings DESC
limit 3;