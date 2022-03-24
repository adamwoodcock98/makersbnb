feature 'Home Page' do
  scenario 'redirects to listings' do
    visit('/')
    expect(page).to have_content "View all of our wonderful properties!"
  end
end