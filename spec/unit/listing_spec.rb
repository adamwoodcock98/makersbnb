require 'listing'
require 'pg'

describe '.all' do
  
  it 'returns all listings' do
    listing = Listing.create(name: 'Brutalist Villa', description: 'Looming internal walls with a aged facade', pence_price: 450)
    listings = Listing.all

    expect(listings.first).to be_a Listing
    expect(listings.first.id).to eq listing.id
    expect(listings.first.name).to eq listing.name
    expect(listings.first.description).to eq listing.description
    expect(listings.first.pence_price).to eq listing.pence_price
  end

end
  
describe Listing do

  it "should be able to create a new listing" do
    listing = Listing.create(name: "Italian villa", description: "A villa by the beach", pence_price: 200)

    expect(listing.name).to eq("Italian villa")
    expect(listing.description).to eq("A villa by the beach")
    expect(listing.pence_price).to eq(200)
  end

end

describe 'available?' do

  before do
    Booking.create(guest_id: "5", listing_id: "5", start_date: "2022-04-01", end_date: "2022-04-08", is_approved: "true")
    Booking.create(guest_id: "6", listing_id: "5", start_date: "2022-04-12", end_date: "2022-04-18", is_approved: "true")
    populate_listings_table
    @property = Listing.create(name: "house", description: "big", pence_price: 2000, host_id: 5)
  end

  it 'should return true if listing is available' do
    expect(@property.available?(start_date: '2022-05-01', end_date: '2022-05-08')).to eq true
  end

  it 'should return false if listing is already booked' do
    expect(@property.available?(start_date: '2022-04-02', end_date: '2022-04-07')).to eq false
  end

end

describe 'quote' do

  before do
    @property = Listing.create(name: "house", description: "big", pence_price: 2000, host_id: 5)
  end

  it 'should return number of nights' do
    expect(@property.number_of_nights("2022-04-01", "2022-04-08")).to eq 7
  end

  it 'should return the price' do
    expect(@property.cost("2022-04-01", "2022-04-08")).to eq 140
  end

end