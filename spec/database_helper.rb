def truncates
  DatabaseConnection.query('TRUNCATE TABLE bookmarks RESTART IDENTITY CASCADE')
end

def add_bookmarks
  DatabaseConnection.query("INSERT INTO bookmarks(url, title) VALUES ('http://www.makersacademy.com', 'Makers'),('http://www.destroyallsoftware.com', 'Destroy Everything'),('http://www.google.com', 'Google')")
end