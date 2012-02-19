class CreateVenueTravelDetails < ActiveRecord::Migration
  def self.up
    create_table :venue_travel_details do |t|
      t.integer :venue_id
      t.string :method
      t.text :details

      t.timestamps
    end
  end

  def self.down
    drop_table :venue_travel_details
  end
end
