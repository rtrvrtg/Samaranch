class CreateMarkers < ActiveRecord::Migration
  def change
    create_table :markers do |t|
      t.string :title
      t.integer :anchor_x
      t.integer :anchor_y

      t.timestamps
    end
  end
end
