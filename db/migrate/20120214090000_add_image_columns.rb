class AddImageColumns < ActiveRecord::Migration
  def self.up
    change_table :sponsors do |t|
      t.has_attached_file :logo
    end
    change_table :guests do |t|
      t.has_attached_file :photo
    end
    change_table :locations do |t|
      t.has_attached_file :marker
    end
    change_table :venue_maps do |t|
      t.has_attached_file :map_image
    end
  end

  def self.down
    drop_attached_file :sponsors, :logo
    drop_attached_file :guests, :photo
    drop_attached_file :locations, :marker
    drop_attached_file :venue_maps, :map_image
  end
end