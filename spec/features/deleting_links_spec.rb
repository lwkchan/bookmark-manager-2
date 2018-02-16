feature 'Deleting links' do
  scenario 'clicking delete link button deletes the specified link' do
    visit('/')
    expect(page).to have_content 'Facebook'
    within ".facebook" do # We will need each bookmark/title to have its own div with class 'title'
      click_button('Delete')
    end
    expect(page).to_not have_content 'Facebook'
    expect(page).to have_content 'Google'
  end
end
