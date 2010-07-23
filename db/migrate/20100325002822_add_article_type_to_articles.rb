class AddArticleTypeToArticles < ActiveRecord::Migration
  def self.up
    remove_column :articles, :type
    add_column :articles, :article_type, :string
  end

  def self.down
    remove_column :articles, :article_type
  end
end
