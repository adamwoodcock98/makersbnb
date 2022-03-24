class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.integer :guest_id
      t.integer :listing_id
      t.date :start_date
      t.date :end_date
      t.boolean :is_approved
    end
  end
end
