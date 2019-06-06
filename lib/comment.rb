class Comment
  attr_reader :id, :text
  def initialize(id, text)
    @id = id
    @text = text
  end
  
  def self.create(bookmark_id, text: nil)
    insert_query = "INSERT INTO comments(bookmark_id, text) VALUES ('#{bookmark_id}', '#{text}');"
    DatabaseConnection.query(insert_query)
  end
end