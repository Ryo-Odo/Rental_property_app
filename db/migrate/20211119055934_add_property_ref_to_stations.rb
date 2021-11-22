class AddPropertyRefToStations < ActiveRecord::Migration[6.0]
  def change
    add_reference :stations, :property, null: false, foreign_key: true
  end
end
