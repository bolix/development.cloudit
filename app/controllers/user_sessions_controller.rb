class UserSessionsController < ApplicationController
  layout('login')

  def new
    @user_session = UserSession.new
    @title = "Cloud-it! |Login"
  end

  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:notice] = "Login Sucessful!"
      redirect_to :controller => :articles, :action => :index
    else
      flash[:notice] = "Login Failed! Try Again"	
      render :action => "new"
    end
  end

  def destroy
    current_user_session.destroy
    flash[:notice] = "Successfully logged out."  
    redirect_to root_path
  end
end