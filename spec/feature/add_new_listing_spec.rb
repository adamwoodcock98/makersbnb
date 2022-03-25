feature "User can add a new space" do

  scenario "User should be able to describe their listing" do
    create_default_user
    sign_in
    visit '/listings/new'
    fill_in "name", with: "Italian styled villa"
    fill_in "description", with: "I have a summer house with 5 rooms near the beach"
    fill_in "price", with: 200

    click_on "List home"
    
    expect(current_path).to eq("/listings")
    expect(page).to have_content("Italian styled villa")
    expect(page).to have_content("I have a summer house with 5 rooms near the beach")
    expect(page).to have_content(200)
  end
  
  scenario "A user that isn't signed in will be redirected" do
    visit('/listings')
    click_button('List a property')
    expect(page).to have_content('You need to be signed in to add a new listing')
  end
end
