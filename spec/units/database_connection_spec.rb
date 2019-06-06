require 'database_connection'

describe DatabaseConnection do
  before(:each) do 
    truncate_tables
    add_bookmarks
  end
  
  it 'returns a pg instance' do
    expect(DatabaseConnection.setup).to be_a(PG::Connection)
  end
end