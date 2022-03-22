feature 'Viewing All Listings' do
  
  scenario 'Basic UI' do
    visit '/listings'
    expect(page).to have_content "Book a Home"
    expect(page).to have_content "View all of our wonderful properties!"
    expect(page).to have_button "List a property"
  end

end