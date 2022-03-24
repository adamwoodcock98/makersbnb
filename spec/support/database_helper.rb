require 'pg'
require 'database_cleaner/active_record'

module DatabaseHelper
  DatabaseCleaner.strategy = :truncation

  def connection(db_name)
    PG.connect(dbname: db_name)
  end

  def setup_table(db_name = 'makersbnb_test', _table_name = 'listings')
    connection(db_name).exec("CREATE TABLE listings(id SERIAL PRIMARY KEY, name VARCHAR(60), description VARCHAR(300), price INT, host_id INT);")
  end

  def truncate_table
    DatabaseCleaner.clean
  end

  def populate_listings_table
      Listing.create(name: 'Mid-Century Modern Home', description: 'In beautiful, sunny Miami by the Oc...', pence_price: 20000, host_id: 9)
      Listing.create(name: 'Big House', description: "Big old house", pence_price: 1800, host_id: 3)
      Listing.create(name: 'Little House', description: "Wee little house", pence_price: 950, host_id: 2)
      Listing.create(name: 'Cardboard Box', description: "Eco-friendly living", pence_price: 300, host_id: 6)
  end

  def check_table_exists(db_name = 'makersbnb_test', table_name = 'listings')
    response = connection(db_name).exec("SELECT EXISTS (SELECT FROM pg_tables WHERE schemaname = 'public' AND tablename = '#{table_name}');")
    if response[0]['exists'] == 't'
      return true
    else
      return false
    end
  end
  
end
