require 'pg'

class Listing
  attr_reader :name, :description, :price

  def initialize(id:, name:, description:, price:)
    @id = id
    @name = name
    @description = description
    @price = price
  end


  def self.create(name:, description:, price:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: "makersbnb_test")
    else
      connection = PG.connect(dbname: "makersbnb")
    end

    result = connection.exec_params('INSERT INTO listings (name, description, price) VALUES($1, $2, $3) RETURNING id, name, description, price', [name, description, (price.to_i * 100)])


    Listing.new(id: result[0]['id'], name: result[0]['name'], description: result[0]['description'], price: (result[0]['price'].to_i))

  end

end