feature 'Booking request sent to host' do
  scenario 'host receives booking of a specific property' do

    visit('/listing_requests')
    

    expect(page).to have_content "Request for 'Mid-Century Modern Home'"
  end
  
  scenario 'shows details of booking' do

    visit('/listing_requests')

    expect(page).to have_content 'From: example@me.com'
    expect(page).to have_content 'Start Date: 05/04/2022'
    expect(page).to have_content 'End Date: 09/04/2022'
    expect(page).to have_content 'No. of days booked: 4'
  end
end
