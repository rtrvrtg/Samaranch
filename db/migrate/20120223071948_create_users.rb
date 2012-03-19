class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string    :login,               :null => false
      t.string    :email,               :null => false
      t.string    :first_name,          :null => false
      t.string    :last_name,           :null => false
      t.string    :crypted_password,    :null => false
      t.string    :password_salt,       :null => false
      t.string    :persistence_token,   :null => false
      t.timestamps
    end
  end
end
