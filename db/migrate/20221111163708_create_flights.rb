class CreateFlights < ActiveRecord::Migration[7.0]
  def change
    create_table :flights do |t|
      t.integer :departure_airport, null:false
      t.integer :arrival_airport, null:false
      t.datetime :start_datetime, null:false
      t.float :flight_duration, null:false

      t.timestamps
    end
  end
end
