class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      #Authlogic Columns
      t.string  :login,                 :null => false 
      t.string  :crypted_password,       :null => false 
      t.string  :password_salt,          :null => false
      t.string  :persistence_token,      :null => false
      #Added Columns for Cloud-it!

      t.integer :votes
      t.text    :description
      t.date    :birthday,               :null => false 
      t.string  :first_name
      t.string  :last_name    
      t.float   :ranking
      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
