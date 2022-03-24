feature 'viewing an individual listing' do

  scenario 'should display property info' do
    property = Listing.create(name: "Serene Woodland Cabin", description: "Nestled deep in the forest is this beautiful, cosy cabin. Perfect for a romantic getaway", pence_price: 8500)
    
    visit '/listings'
    first('.listing').click_on 'view details'

    expect(current_path).to eq "/listings/#{property.id}"
    expect(page).to have_content property.name
    expect(page).to have_content property.description
    expect(page).to have_content (property.pence_price / 100)
  end

end

feature 'requesting a booking' do

  before do
    populate_listings_table
    visit '/listings'
    first('.listing').click_on 'view details'
  end

  scenario 'should display request UI elements' do
    expect(page).to have_content 'Start Date:'
    expect(page).to have_field 'start_date'
    expect(page).to have_content 'End Date:'
    expect(page).to have_field 'end_date'
    expect(page).to have_button 'Check availability'
  end

  scenario 'should show a quote and allow booking when listing is available' do
    # fill_in('start_date', with: '01/04/2022')
    # fill_in('start_date', with: '08/04/2022')
    # click_on 'Check availability'

    # expect(page).to have_content 'Great news! This property is available to book for your selected dates.'
    # expect(page).to have_content 'The price for your 7 night trip is: £1400.00'
    # expect(page).to have_button 'Request booking'
  end

  scenario 'should prevent booking when a property is not available' do

  end
  
  scenario 'should show a booking request' do
    
  end

end