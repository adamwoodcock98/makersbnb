feature 'Viewing All Listings' do

  before do
    populate_listings_table
  end
  
  scenario 'Basic UI' do
    visit '/listings'
    expect(page).to have_content "Book a Home"
    expect(page).to have_content "View all of our wonderful properties!"
    expect(page).to have_button "List a property"
  end

  scenario 'list listings' do
    visit '/listings'
    expect(page).to have_content "Mid-Century Modern Home"
    expect(page).to have_content "In beautiful, sunny Miami by the Oc..."
    expect(page).to have_content "£200.00 per night"
  end

end
