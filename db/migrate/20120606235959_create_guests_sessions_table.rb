class CreateGuestsSessionsTable < ActiveRecord::Migration
  def up
    create_table :guests_sessions, :id => false do |t|
      t.references :guest
      t.references :session
    end
    add_index :guests_sessions, [:guest_id, :session_id]
    add_index :guests_sessions, [:session_id, :guest_id]
  end

  def down
    drop_table :guests_sessions
  end
end
