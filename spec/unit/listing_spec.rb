require 'listing'

    require 'pg'

describe '.all' do
  #replace with self.create when merged

  before do
    connection = PG.connect(dbname: 'makersbnb_test')
    # connection.query("INSERT INTO listings (name, description, price, host_user_id) VALUES ('House A', 'It is a mid-century modern home in Miami', 200, 1)")
  end
  
  it 'returns all listings' do
    
    listings = Listing.all

    expect(listings.first).to be_a Listing
    # expect(listings.id).to eq -- Add id test when create returns wrapped object
    expect(listings.first.name).to eq 'Mid-Century Modern Home'
    expect(listings.first.description).to eq 'In beautiful, sunny Miami by the Oc...'
    expect(listings.first.price).to eq 200
    
  end
end
  
  describe Listing do
  it "should be able to create a new listing" do

    listing = Listing.create(name: "Italian villa", description: "A villa by the beach", price: 200)

    expect(listing.name).to eq("Italian villa")
    expect(listing.description).to eq("A villa by the beach")
    expect(listing.price).to eq(20000)
  end
end