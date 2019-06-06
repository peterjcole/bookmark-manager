def truncate_tables
  DatabaseConnection.query('TRUNCATE TABLE bookmarks RESTART IDENTITY CASCADE')
end

def add_bookmarks
  DatabaseConnection.query("INSERT INTO bookmarks(url, title) VALUES ('http://www.makersacademy.com', 'Makers'),('http://www.destroyallsoftware.com', 'Destroy Everything'),('http://www.google.com', 'Google');")
end

def add_comments
  DatabaseConnection.query("INSERT INTO comments(text, bookmark_id) VALUES ('Learn to code!', 1),('Smashing', 2),('Well, it''s google.', 3),('Better than Bing', 3);")
end

def query_bookmarks
  test_query = 'SELECT * FROM bookmarks ORDER BY id'
  DatabaseConnection.query(test_query)
end

def query_comments(bookmark_id)
  test_query = "SELECT * FROM comments WHERE bookmark_id = #{bookmark_id} ORDER BY id"
  DatabaseConnection.query(test_query)
end