SELECT name,
       post_count,
       RANK() OVER (ORDER BY post_count DESC) AS post_rank
FROM (
  SELECT u.name,
         COUNT(p.id) AS post_count
  FROM users u
  LEFT JOIN posts p ON p.user_id = u.id
  GROUP BY u.id, u.name
) AS user_posts
ORDER BY post_count DESC;
