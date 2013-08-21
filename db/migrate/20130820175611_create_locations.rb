class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.string :address
      t.string :food
      t.string :price

      t.timestamps
    end
  end
end
