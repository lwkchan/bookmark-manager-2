feature "viewing links" do
  scenario "User can see links" do
    visit '/'
    expect(page).to have_content "http://www.facebook.com"
    expect(page).to have_content "http://www.google.com"
  end
end
