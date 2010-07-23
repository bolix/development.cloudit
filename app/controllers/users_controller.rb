class UsersController < ApplicationController
  before_filter :login_required, :only => [:show]

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
   if @user.save
    flash[:notice] = "User created Sucessfully!"
    redirect_to new_user_session_path
   else
     render :action => 'new'
   end
  end
  

  def index

  end
  
  def show
    @user = current_user
    @articles = Article.find(:all)
  end
  

  
  
end
