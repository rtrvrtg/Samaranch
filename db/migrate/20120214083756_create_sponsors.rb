class CreateSponsors < ActiveRecord::Migration
  def self.up
    create_table :sponsors do |t|
      t.string :name
      t.integer :sponsor_type_id
      t.text :description
      t.text :website
      t.text :twitter
      t.text :facebook
      t.integer :location_id

      t.timestamps
    end
  end

  def self.down
    drop_table :sponsors
  end
end
