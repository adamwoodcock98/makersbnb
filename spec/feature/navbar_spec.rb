feature "navbar can navigate through all pages" do
  scenario "clicking on 'Listings from listings/new should return the user back to /listings" do
    visit '/listings'
    click_on 'List a property'
    click_on 'Listings'

    expect(current_path).to eq('/listings')
  end

  scenario "clicking on 'Listings' after clicking 'view details' should return user back to /listings" do
    visit '/listings/new'
    fill_in "name", with: "Italian styled villa"
    fill_in "description", with: "I have a summer house with 5 rooms near the beach"
    fill_in "price", with: 200
    click_on "List home"

    click_on 'view details'

    click_on 'Listings'

    expect(current_path).to eq('/listings')
  end
  


end