class Vote < ActiveRecord::Base
	belongs_to :user
    belongs_to :article


    validates_uniqueness_of :user_id,:scope => [:article_id]

    named_scope :find_by_article, lambda { |article_id| {:conditions => ["votes.article_id =?", article_id] } }

  

end
