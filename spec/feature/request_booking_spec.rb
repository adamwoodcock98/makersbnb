feature 'Guest requests booking' do
  before do
    listing = Listing.create(
      name: 'Cute Cottage', 
      description: 'xyz', 
      pence_price: 20000, 
      host_id: 5)
    
      Listing.create(
      name: 'Cute Cottage 2', 
      description: 'xyz xyz', 
      pence_price: 10000, 
      host_id: 7) 
  end
  
  scenario 'Guest can request a specific property booking' do
    
    visit '/requests-confirmation'

    booking = Booking.create(listing_id: 1)

    expect(current_path).to eq('/requests-confirmation')
    expect(page).to have_content('Request for Cute Cottage')
  end
end