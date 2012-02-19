class CreateSessions < ActiveRecord::Migration
  def self.up
    create_table :sessions do |t|
      t.string :title
      t.datetime :start
      t.datetime :end
      t.integer :location_id
      t.integer :session_type_id
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :sessions
  end
end
