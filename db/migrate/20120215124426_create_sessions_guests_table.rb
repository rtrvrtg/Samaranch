class CreateSessionsGuestsTable < ActiveRecord::Migration
  def up
    create_table :sessions_guests, :id => false do |t|
      t.references :session
      t.references :guest
    end
    add_index :sessions_guests, [:session_id, :guest_id]
    add_index :sessions_guests, [:guest_id, :session_id]
  end

  def down
    drop_table :sessions_guests
  end
end
