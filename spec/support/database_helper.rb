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

  def populate_listings_table(db_name = 'makersbnb_test')
    defaults = [
      { name: 'Mid-Century Modern Home', description: 'In beautiful, sunny Miami by the Oc...', pence_price: 20_000, host_id: 9 },
      { name: 'Big House', description: "Big old house", pence_price: 1800, host_id: 3 },
      { name: 'Little House', description: "Wee little house", pence_price: 950, host_id: 2 },
      { name: 'Cardboard Box', description: "Eco-friendly living", pence_price: 300, host_id: 6 },
    ]
    defaults.each do |entry|
      params = [
        entry[:name],
        entry[:description],
        entry[:pence_price],
        entry[:host_id]
      ]
      connection(db_name).exec_params("INSERT INTO listings (name, description, pence_price, host_id) VALUES ($1, $2, $3, $4);", params)
    end
  end
end
