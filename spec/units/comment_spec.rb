require 'comment'

describe Comment do

  before :each do
    truncate_tables
    add_bookmarks
    add_comments
  end

  let(:comment) { Comment.new(1, "hello") }

  describe '#id' do
    it 'has an id' do
      expect(comment.id).to be 1
    end
  end

  describe '#text' do
    it 'has text' do
      expect(comment.text).to eq("hello")
    end
  end

  describe '.create' do
    it 'creates a comment' do
      Comment.create(1, text: "Hello")
      expect(query_comments(1)[0]['bookmark_id']).to eq('1')
      expect(query_comments(1).values.last[1]).to eq('Hello')
    end
  end

end