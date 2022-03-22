require 'pg'

module DatabaseHelper
  def connection(db_name)
    PG.connect(dbname: db_name)
  end

  def setup_table(db_name = 'makersbnb_test', table_name = 'listings')
    connection(db_name).exec("CREATE TABLE listings(id SERIAL PRIMARY KEY, name VARCHAR(60), description VARCHAR(300), price INT, host_user_id INT);")
  end

  def truncate_table(db_name = 'makersbnb_test', table_name = 'listings')
    if check_table_exists(table_name)
      connection(db_name).exec("TRUNCATE #{table_name};")
    else
      setup_table(db_name, table_name)
    end
  end

  def populate_listings_table(db_name = 'makersbnb_test')
    defaults = [
      { name: 'Big House', description: "Big old house", price: 1800, host_user_id: 3 },
      { name: 'Little House', description: "Wee little house", price: 950, host_user_id: 2 },
      { name: 'Cardboard Box', description: "Eco-friendly living", price: 300, host_user_id: 6 },
    ]
    defaults.each do |entry|
      params = [
        entry[:name],
        entry[:description],
        entry[:price],
        entry[:host_user_id]
      ]
      connection(db_name).exec_params("INSERT INTO listings (name, description, price, host_user_id) VALUES ($1, $2, $3, $4);", params)
    end
  end

  def check_table_exists(db_name = 'makersbnb_test', table_name ='listings')
    response = connection(db_name).exec("SELECT EXISTS (SELECT FROM pg_tables WHERE schemaname = 'public' AND tablename = '#{table_name}');")
    if response[0]['exists'] == 't'
      return true
    else
      return false
    end
  end
end
