feature "navbar can navigate through all pages" do
  before do
    create_default_user
    sign_in
  end

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
 
  scenario "User should sign in and see Listings, Requests, Sign out buttons" do
    expect(page).to have_button('Listings')
    expect(page).to have_button('Requests')
    expect(page).to have_button('Sign out')
  end

  scenario "user clicks sign out and can see the following Listings, Sign up and Sign up" do  
    visit '/'
    click_on 'Sign out'

    expect(page).to have_button('Listings')
    expect(page).to have_button('Sign up')
    expect(page).to have_button('Sign in')
  end

end