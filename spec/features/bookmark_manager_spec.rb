feature 'bookmark_manager' do
  feature 'view all bookmarks' do
    background { truncates }
    background { add_bookmarks }

    scenario 'user can see bookmarks' do
      visit('/')
      expect(page).to have_content "http://www.makersacademy.com"
      expect(page).to have_content "http://www.google.com"
      expect(page).to have_content "http://www.destroyallsoftware.com"
    end
  end

  feature 'adding bookmarks' do
    scenario 'user can add a bookmark' do
      pending('add setup in view & bookmark class')
      visit '/add'
      fill_in('url', with: 'http://nomnoml.com')
      click_button('add')
      expect(page).to have_context "http://nomnoml.com"
    end
  end
end