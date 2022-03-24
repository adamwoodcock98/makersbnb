feature "User can add a new space" do

  scenario "User should be able to describe their listing" do
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

end
