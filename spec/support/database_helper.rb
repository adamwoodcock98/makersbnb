require 'pg'

module DatabaseHelper
  def truncate_table(db_name = 'makersbnb_test', table_name = 'listings')
    connection = PG.connect(dbname: db_name)
    connection.exec("TRUNCATE #{table_name};")
  end
end