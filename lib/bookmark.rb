require 'pg'
require_relative 'database_connection'

class Bookmark
  attr_reader :id, :url, :title

  def initialize(id, url, title = "")
    @id = id.to_i
    @url = url
    @title = title
  end
  
  def self.all
    result = DatabaseConnection.query('SELECT * FROM bookmarks;')
    result.map{ |bookmark| Bookmark.new(bookmark['id'], bookmark['url'], bookmark['title']) }
  end

  def self.create(url, title = "")
    insert_query = "INSERT INTO bookmarks(url, title) VALUES ('#{url}', '#{title}');"
    DatabaseConnection.query(insert_query)
  end

  def self.delete(id)
    delete_query = "DELETE FROM bookmarks WHERE id = #{id}"
    DatabaseConnection.query(delete_query)
  end

  def self.update(id, title: nil)
    update_query = "UPDATE bookmarks SET title = '#{title}' WHERE id = #{id};"
    DatabaseConnection.query(update_query)
  end
end