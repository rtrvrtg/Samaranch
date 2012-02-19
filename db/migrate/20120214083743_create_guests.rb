class CreateGuests < ActiveRecord::Migration
  def self.up
    create_table :guests do |t|
      t.string :name
      t.string :sorting_name
      t.text :bio
      t.text :website
      t.text :twitter
      t.text :facebook

      t.timestamps
    end
  end

  def self.down
    drop_table :guests
  end
end
