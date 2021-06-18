class CreateFlights < ActiveRecord::Migration[6.1]
  def change
    create_table :flights do |t|
      t.string :number
      t.string :departure_airport
      t.string :arrival_airport
      t.integer :business_class_seats
      t.integer :economy_class_seats
      t.integer :duration
      t.datetime :departure_date

      t.timestamps
    end
  end
end
