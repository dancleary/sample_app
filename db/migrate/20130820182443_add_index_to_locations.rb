class AddIndexToLocations < ActiveRecord::Migration
  def change
  	add_index :locations, :name, unique: true
  	add_index :locations, :address, unique: true
  end
end
