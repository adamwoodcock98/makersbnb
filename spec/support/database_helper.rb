require 'pg'
require 'database_cleaner/active_record'

module DatabaseHelper
  DatabaseCleaner.strategy = :truncation

  def truncate_table
    DatabaseCleaner.clean
  end

  def populate_listings_table
      Listing.create(name: 'Mid-Century Modern Home', description: 'In beautiful, sunny Miami by the Oc...', pence_price: 20000, host_id: 9)
      Listing.create(name: 'Big House', description: "Big old house", pence_price: 1800, host_id: 3)
      Listing.create(name: 'Little House', description: "Wee little house", pence_price: 950, host_id: 2)
      Listing.create(name: 'Cardboard Box', description: "Eco-friendly living", pence_price: 300, host_id: 6)
  end
  
end
