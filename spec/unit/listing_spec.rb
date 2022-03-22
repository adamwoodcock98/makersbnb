require 'listing'

require 'pg'

describe '.all' do
  
  it 'returns all listings' do
    listing = Listing.create(name: 'Brutalist Villa', description: 'Looming internal walls with a aged facade', price: 450)

    listings = Listing.all

    expect(listings.first).to be_a Listing
    expect(listings.first.id).to eq listing.id
    expect(listings.first.name).to eq listing.name
    expect(listings.first.description).to eq listing.description
    expect(listings.first.price).to eq listing.price
    
  end
end
  
describe Listing do
  it "should be able to create a new listing" do

    listing = Listing.create(name: "Italian villa", description: "A villa by the beach", price: 200)

    expect(listing.name).to eq("Italian villa")
    expect(listing.description).to eq("A villa by the beach")
    expect(listing.price).to eq(200)
  end
end
