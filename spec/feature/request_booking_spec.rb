feature 'Guest requests booking' do
  before do
    listing = Listing.create(
      name: 'Cute Cottage', 
      description: 'xyz', 
      pence_price: 20000, 
      host_id: 1)

      User.create(
        first_name: 'Abdul',
        last_name: 'ghost',
        user_name: 'ghostman123',
        email: 'ghost@ghost.com',
        password: '123'
      )

      visit'/'
      click_on 'Sign in'
      fill_in 'email', with: 'ghost@ghost.com'
      fill_in 'password', with: '123'
      find('#create_new_session').click_button('Sign in')
      
      click_on 'view details'
  
      fill_in('start_date', with: "01/08/2022")
      fill_in('end_date', with: "09/08/2022")
  
      click_on 'Check availability'
      click_on 'Request booking'
  
      booking = Booking.create(listing_id: 1)
  end
  
  scenario 'Guest can request a specific property booking' do

    expect(current_path).to eq('/requests/:id/availability/request')
    expect(page).to have_content('Request for Cute Cottage')
    expect(page).to have_content('ghost@ghost.com')
    expect(page).to have_content('From date: 01/08/2022')
    expect(page).to have_content('To: 09/08/2022')
  end

  scenario 'when host clicks on Confirm booking it should post to /confirm' do
    click_on 'Confirm Booking'

    expect(current_path).to eq('/confirm')
  end

  scenario 'when host clicks on Deny Booking it should go to /requests' do
    click_on 'Deny Booking'

    expect(current_path).to eq('/requests')
  end

end