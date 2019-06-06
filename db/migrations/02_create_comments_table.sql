CREATE TABLE comments (
  id SERIAL PRIMARY KEY,
  text VARCHAR(240),
  bookmark_id SERIAL REFERENCES bookmarks(id) ON DELETE CASCADE
);