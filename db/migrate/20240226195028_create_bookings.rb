class CreateBookings < ActiveRecord::Migration[7.1]
  def change
    create_table :bookings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :pokemon, null: false, foreign_key: true
      t.float :total_price
      t.date :start_date
      t.date :end_date
      t.boolean :availability


      t.timestamps
    end
  end
end
