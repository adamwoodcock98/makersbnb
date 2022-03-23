feature 'Guest requests a space for a particular night' do
  scenario "can see the request page" do
    visit '/requests_page'

    expect(page).to have_content("Beautiful relaxing Space")
    expect(page).to have_content("Pick a night!")
  end

  
  scenario "Can pick start and end dates" do
    visit '/requests_page'
    # The fill_in parts dont work with the date picker
    # change to a flash notice
    fill_in "start date", with: "01/04/2022"
    fill_in "end date", with: "05/04/2022"
    click_on "Request to book"
  end
end