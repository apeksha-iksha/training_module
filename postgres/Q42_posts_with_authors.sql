
SELECT p.title,
       u.name AS author_name
FROM posts p
JOIN users u ON p.user_id = u.id;
