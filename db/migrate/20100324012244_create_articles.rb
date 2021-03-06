class CreateArticles < ActiveRecord::Migration
  def self.up
    create_table :articles do |t|
      t.string :title
      t.string :url
      t.text :description
      t.string :pic_url
      t.string :type

      t.timestamps
    end
  end

  def self.down
    drop_table :articles
  end
end
s