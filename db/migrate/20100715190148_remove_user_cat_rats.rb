class RemoveUserCatRats < ActiveRecord::Migration
  def self.down
    drop_table :usr_cat_rats
  end
end

