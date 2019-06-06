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
    return false unless %r{[(http(s)?):\/\/(www\.)?a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,6}\b([-a-zA-Z0-9@:%_\+.~#?&//=]*)}i.match(url)
    insert_query = "INSERT INTO bookmarks(url, title) VALUES ('#{url}', '#{title}');"
    DatabaseConnection.query(insert_query)
  end

  def self.delete(id)
    delete_query = "DELETE FROM bookmarks WHERE id = #{id}"
    DatabaseConnection.query(delete_query)
  end

  def self.update(id, title: nil, url: nil)
    update_query = "UPDATE bookmarks SET title = '#{title}', url = '#{url}' WHERE id = #{id};"
    DatabaseConnection.query(update_query)
  end

  def self.get(id)
    bookmark = DatabaseConnection.query("SELECT * FROM bookmarks WHERE id = #{id};")[0]
    Bookmark.new(bookmark['id'], bookmark['url'], bookmark['title'])
  end
end