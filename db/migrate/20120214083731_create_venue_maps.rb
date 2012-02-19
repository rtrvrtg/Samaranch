class CreateVenueMaps < ActiveRecord::Migration
  def self.up
    create_table :venue_maps do |t|
      t.integer :venue_id
      t.string :map_name

      t.timestamps
    end
  end

  def self.down
    drop_table :venue_maps
  end
end
