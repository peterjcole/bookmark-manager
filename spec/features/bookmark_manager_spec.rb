feature 'bookmark_manager' do
  feature 'view all bookmarks' do
    background { truncates }
    background { add_bookmarks }
    Capybara.default_driver = :selenium
    Capybara.server = :webrick

    scenario 'user can see bookmark URLs' do
      visit('/')
      expect(page).to have_content "http://www.makersacademy.com"
      expect(page).to have_content "http://www.google.com"
      expect(page).to have_content "http://www.destroyallsoftware.com"
    end
    
  end

  feature 'adding bookmarks' do
    scenario 'user can add a bookmark' do
      visit '/add'
      fill_in('url', with: 'http://nomnoml.com')
      click_button('Add')
      expect(page).to have_content "http://nomnoml.com"
    end
  end
end