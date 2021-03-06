class Article < ActiveRecord::Base
########### Relationships ##########
  
belongs_to :category
belongs_to :user
has_many :votes, :dependent => :destroy
has_many :comments, :dependent => :destroy

accepts_nested_attributes_for :votes

########### Validators ############
validates_presence_of :description, :on => :create, :message => "You need to fill in the description"
validates_presence_of :title, :on => :create, :message => "You need to specify a Title"
validates_presence_of :url, :on => :create, :message => "You need to specify an URL"
validates_presence_of :article_type, :on => :create, :message => "You need to specify a Type"
validates_presence_of :category, :on => :create, :message => "You need to specify a type"


named_scope :voted_by, lambda {|user| {:joins => :votes, :conditions => ["votes.user_id = ?",  user]}  }

def to_s

end

#  def ucr
#    sum_of_scores = UserCategoryRating.inject {|sum, s| sum + s.value }
#    sum_of_scores / UserCategoryRating.length
#  end

end
