require 'listing'

describe Listing do
  it "should be able to create a new listing" do

    listing = Listing.create(name: "Italian villa", description: "A villa by the beach", price: 200)

    expect(listing.name).to eq("Italian villa")
    expect(listing.description).to eq("A villa by the beach")
    expect(listing.price).to eq(20000)
  end
end