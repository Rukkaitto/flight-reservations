class CreateFlights < ActiveRecord::Migration[6.1]
  def change
    create_table :flights do |t|
      t.string :number
      t.string :departure_airport
      t.string :arrival_airport
      t.datetime :departure_datetime
      t.datetime :arrival_datetime
      t.integer :max_eco_seats
      t.integer :max_business_seats

      t.timestamps
    end
  end
end
