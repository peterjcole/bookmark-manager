require 'bookmark'

describe Bookmark do
  before(:each) { truncates }
  before(:each) { add_bookmarks }

  it 'has a url' do
    bookmark = Bookmark.new('http://example.com')
    expect(bookmark.url).to eq('http://example.com')
  end

  it '.all returns an array of bookmarks' do
    output = Bookmark.all
    expect(output).to satisfy { output.all?(Bookmark) }
  end

  it '.all returns the test bookmarks' do
    output = Bookmark.all
    example_1 = "http://www.makersacademy.com"
    example_2 = "http://www.destroyallsoftware.com"
    example_3 = "http://www.google.com"
    expect(output[0].url).to eq(example_1)
    expect(output[1].url).to eq(example_2)
    expect(output[2].url).to eq(example_3)
  end
end
