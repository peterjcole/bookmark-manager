require 'pg'
require_relative 'database_connection'

class Bookmark
  attr_reader :url, :title

  def initialize(url, title = "")
    @url = url
    @title = title
  end
  
  def self.all
    result = DatabaseConnection.query('SELECT * FROM bookmarks;')
    result.map{ |bookmark| Bookmark.new(bookmark['url'], bookmark['title']) }
  end

  def self.create(url, title = "")
    insert_query = "INSERT INTO bookmarks(url, title) VALUES ('#{url}', '#{title}');"
    DatabaseConnection.query(insert_query)
  end
end