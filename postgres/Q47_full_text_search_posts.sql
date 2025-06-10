SELECT id,
       title
FROM posts
WHERE to_tsvector('english', content) @@ to_tsquery('english', 'Rails & React');
