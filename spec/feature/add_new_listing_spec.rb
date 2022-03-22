feature "User can add a new space" do

  scenario "User should be able to describe their listing" do
    visit '/new'
    fill_in "name-space", with: "Italian styled villa"
    fill_in "description-space", with: "I have a summer house with 5 rooms near the beach"
    fill_in "price-space", with: 200

    click_on "List space"

    expect(current_path).to eq("/")
    expect(page).to have_content("Italian styled villa")
    expect(page).to have_content("I have a summer house with 5 rooms near the beach")
    expect(page).to have_content(550)
  end

end