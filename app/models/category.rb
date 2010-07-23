class Category < ActiveRecord::Base

  has_many :articles, :dependent => :destroy

  has_many :user_category_ratings, :dependent => :destroy
  has_many :users, :through => :user_category_ratings

  def to_s
    "#{name}"
  end
end
