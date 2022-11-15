class AddAirportCodeToAirports < ActiveRecord::Migration[7.0]
  def change
    add_column :airports, :airport_code , :string , null:false , unique: true
  end
end
