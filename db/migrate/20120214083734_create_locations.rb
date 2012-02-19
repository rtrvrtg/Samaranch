class CreateLocations < ActiveRecord::Migration
  def self.up
    create_table :locations do |t|
      t.string :name
      t.text :description
      t.integer :venue_map_id
      t.integer :x
      t.integer :y

      t.timestamps
    end
  end

  def self.down
    drop_table :locations
  end
end
