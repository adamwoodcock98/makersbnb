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
    # listing = Listing.create(name: "Italian villa", description: "A villa by the beach", pence_price: 200)

    # expect(listing.name).to eq("Italian villa")
    # expect(listing.description).to eq("A villa by the beach")
    # expect(listing.pence_price).to eq(200)
  end

end

describe 'available?' do

  it 'should respond to all with 3 arguments' do

  end

end