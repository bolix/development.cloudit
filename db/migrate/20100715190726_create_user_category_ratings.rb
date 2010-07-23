class CreateUserCategoryRatings < ActiveRecord::Migration
  def self.up
    create_table :user_category_ratings do |t|
      t.references :user
      t.references :category
      t.float :rating

      t.timestamps
    end
  end

  def self.down
    drop_table :user_category_ratings
  end
end
