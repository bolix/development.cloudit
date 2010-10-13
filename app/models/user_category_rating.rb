class UserCategoryRating < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  #validates_uniqueness_of :user_id, :scope => [:article_id]  

end
