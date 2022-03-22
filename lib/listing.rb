require 'pg'

class Listing

  attr_reader :name, :description, :price

  def initialize(id:, name:, description:, price:)
    @id = id
    @name = name
    @description = description
    @price = price
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: "makersbnb_test")
    else
      connection = PG.connect(dbname: "makersbnb")
    end
    result = connection.exec('SELECT * FROM listings')
    result.map { |listing| 
      Listing.new(id: listing['id'], name: listing['name'], description: listing['description'], price: (listing['price']).to_i / 100)
    }
   
  end

end