class User < ActiveRecord::Base
  # Command Added to enable Authlogic Functionality
  acts_as_authentic

  #ActiveRecord Associations
  has_many :articles
  has_many :votes, :dependent => :destroy
  has_many :comments, :dependent => :destroy
  
  has_many :user_category_ratings, :dependent => :destroy
  has_many :categories, :through => :user_category_ratings

  
  #Username Validation
  validates_presence_of :login, :on => :create, :message => "You need to specify an Username"
  validates_uniqueness_of :login, :on => :create, :message => "This username is already taken"
  validates_length_of :login, :within => 4..15, :on => :create, :message => "Username must be between 4 and 15 Characters"
 
  #Password Validation
  validates_presence_of :password, :on => :create, :message => "Your Password can't be blank"
  validates_presence_of :password_confirmation, :on => :create, :message => "Your Password Confirmation can't be blank"
  validates_length_of :password, :within => 4..15, :on => :create, :message => "Password must be between 4 and 15 Characters"
  validates_confirmation_of :password, :on => :create, :message => "Password and Password Confirmation must match"
 
  #Email Validation
  validates_format_of :email, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i, :message => 'should be in this format john@doe.com'
  validates_uniqueness_of :email, :on => :create, :message => "This Email address it's already registered"
 
  #Birthday Validation

  #Adds Avatars to the Users
  is_gravtastic!

  named_scope :articles_voted_on, :select => "votes.article_id",:include => :votes, :condition => "user_id = "

  def voted_on_article?(article)
    Article.voted_by(self).include?(article)
  end

end
