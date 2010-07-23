class CreateUsrCatRats < ActiveRecord::Migration
  def self.up
    create_table :usr_cat_rats do |t|
      t.integer :user_id
      t.integer :category_id
      t.decimal :rating

      t.timestamps
    end
  end

  def self.down
    drop_table :usr_cat_rats
  end
end
