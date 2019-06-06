require 'bookmark'

describe Bookmark do
  before(:each) { truncates }
  before(:each) { add_bookmarks }
  let(:bookmark) { Bookmark.new(1, 'http://example.com', 'Example title') }

  describe '#url' do
    it 'has a url' do
      expect(bookmark.url).to eq('http://example.com')
    end
  end

  describe '#title' do
    it 'has a title' do
      expect(bookmark.title).to eq('Example title')
    end
  end

  describe '#id' do
    it 'has an id' do
      expect(bookmark.id).to be 1
    end
  end

  describe '.all' do
    let(:output) { Bookmark.all }
    it 'returns an array of bookmarks' do
      expect(output).to satisfy { output.all?(Bookmark) }
    end

    it 'returns the test bookmarks' do
      example_1 = "http://www.makersacademy.com"
      example_2 = "http://www.destroyallsoftware.com"
      example_3 = "http://www.google.com"
      expect(output[0].url).to eq(example_1)
      expect(output[1].url).to eq(example_2)
      expect(output[2].url).to eq(example_3)
    end

    it 'returns bookmarks with titles' do
      expect(output[0].title).to eq('Makers') 
    end

    it 'returns correct IDs' do
      expect(output[0].id).to be 1
      expect(output[1].id).to be 2
      expect(output[2].id).to be 3
    end
  end

  describe '.create' do
    it 'adds a bookmark to the database with a URL only' do
      url = 'http://example.com'
      Bookmark.create(url)
      test_query = 'SELECT * FROM bookmarks WHERE id = 4;'
      expect(DatabaseConnection.query(test_query)[0]['url']).to eq(url)
    end
    it 'adds a bookmark to the database with a URL and a title' do
      url = 'http://example.com'
      title = 'Example title'
      Bookmark.create(url, title)
      test_query = 'SELECT * FROM bookmarks WHERE id = 4;'
      expect(query_bookmarks[3]['url']).to eq(url)
      expect(query_bookmarks[3]['title']).to eq(title)
    end
    it 'returns false if URL is invalid' do
      url = 'bloop'
      title = 'Example title'
      expect(Bookmark.create(url, title)).to be false
    end
  end

  describe '.delete' do
    it 'deletes a bookmark by ID' do
      Bookmark.delete(1)
      expect(query_bookmarks.column_values(0)).not_to include('1')
      expect(query_bookmarks.values.flatten).not_to include('http://www.makersacademy.com')
    end
  end

  describe '.update' do
    it "updates a bookmark's title by id" do
      Bookmark.update(1, title: "Coffee academy")
      expect(query_bookmarks[0]['title']).to eq('Coffee academy')
    end

    it "updates a bookmark's url by id" do
      Bookmark.update(1, url: "http://coffeeacademy.biz")
      expect(query_bookmarks[0]['url']).to eq('http://coffeeacademy.biz')
    end

    it 'can update both title and url at once' do
      Bookmark.update(1, url: "http://coffeeacademy.biz", title: 'Coffee academy')
      expect(query_bookmarks[0]['url']).to eq('http://coffeeacademy.biz')
      expect(query_bookmarks[0]['title']).to eq('Coffee academy')
    end
  end

  describe '.get' do
    it 'returns the bookmark with the id specified' do
      expect(Bookmark.get(1)).to be_a Bookmark
      expect(Bookmark.get(1).title).to eq('Makers')
      expect(Bookmark.get(1).url).to eq('http://www.makersacademy.com')
    end
  end
  
end
