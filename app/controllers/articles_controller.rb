class ArticlesController < ApplicationController
  before_filter :login_required, :only => [:new]

  def index
   @user = current_user
   @articles = Article.find(:all)
   @title = "Cloud-it! |Home"
  end
  
  def show
    @article = Article.find(params[:id])
    @title = "Cloud-it! |#{@article.title}"
    @user = current_user
  end

  def new
    @title = "Cloud-it! |New Article"
    @article = Article.new
    @categories = Category.find(:all)
  end

  def create
    @article = Article.new(params[:article])
    @article.user_id = current_user.id
   if @article.save
    flash[:notice] = "Article Submitted Successfully"
     redirect_to :controller => :articles, :action => :index
   else
     render :controller => "articles", :action => 'new'
   end
  end

  def delete
    @article = Article.find(params[:id])
	if @article.destroy
      flash[:notice] = "Article Deleted Successfully"
      redirect_to :controller => :articles, :action => :index
    else
      redirect_to :controller => :articles, :action => :index
      flash[:notice] = "Your article could not be deleted"
    end
  end


  end
