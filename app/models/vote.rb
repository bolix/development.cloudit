class Vote < ActiveRecord::Base
	belongs_to :user
    belongs_to :article

    validates_uniqueness_of :user_id, :on => :create, :message => "You have already submitted a vote!"

end
