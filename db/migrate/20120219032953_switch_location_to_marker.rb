class SwitchLocationToMarker < ActiveRecord::Migration
  def up
    drop_attached_file :locations, :marker
    add_column :locations, :marker_id, :integer
  end

  def down
    remove_column :locations, :marker_id
    change_table :locations do |t|
      t.has_attached_file :marker
    end
  end
end
