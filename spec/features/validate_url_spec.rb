feature 'Checking URL is valid' do
  scenario 'Adding an invalid link raises an error' do
    visit '/'
    fill_in 'new_link', with: 'www.random'
    click_button 'Add Bookmark'
    expect(page).to have_content('Error - that is not a link.')
  end
end
