class AddEmailtoUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :email, :string, { :null => false, :default => false }
  end

  def self.down
    remove_column :users, :email
  end
end
