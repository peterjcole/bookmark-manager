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

  def self.where(bookmark_id: nil)
    result = DatabaseConnection.query("SELECT * FROM comments WHERE bookmark_id = #{bookmark_id}")
    result.map { |comment| Comment.new(comment['id'], comment['text']) }
  end
end