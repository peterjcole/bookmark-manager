require 'pg'
require_relative 'database_connection'

class Bookmark
  attr_reader :url

  def initialize(url)
    @url = url
  end
  
  def self.all
    DatabaseConnection.setup
    result = DatabaseConnection.query('SELECT * FROM bookmarks')
    result.map{ |bookmark| Bookmark.new(bookmark['url']) }
  end
end