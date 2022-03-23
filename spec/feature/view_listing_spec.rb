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

  scenario 'should display booking options' do

  end
  
  scenario 'should show a booking request' do
    
  end

end