require 'pg'
require_relative 'database_connection'

class Bookmark
  attr_reader :url

  def initialize(url)
    @url = url
  end
  
  def self.all
    result = DatabaseConnection.query('SELECT * FROM bookmarks;')
    result.map{ |bookmark| Bookmark.new(bookmark['url']) }
  end

  def self.create(url)
    insert_query = "INSERT INTO bookmarks(url) VALUES ('#{url}');"
    DatabaseConnection.query(insert_query)
  end
end