class CreateListings < ActiveRecord::Migration[7.0]
  def change
    create_table :listings do |t|
      t.string :name
      t.string :description
      t.integer :price
      t.integer :host_user_id
    end
  end
end
