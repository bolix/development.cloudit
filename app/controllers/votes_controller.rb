class VotesController < ApplicationController
  def new
    
    @vote = Vote.new
  end

  def create
    @vote = Vote.new(params[:vote])
    @user_rating = UserCategoryRating.new
    @vote.user_id = current_user.id

    @article = Article.find(@vote.article_id)
    @user_rating.category_id = @article.category_id
    @user_rating.user_id = @article.user_id

    if @vote.save
      @user_rating.rating = @article.votes.average('value')
      @user_rating.save
      flash[:notice] = "Your vote has been sumbmitted sucessfully"
      redirect_to :controller => :articles
    else
        flash[:error] = "You have already voted for this article!"
        redirect_to :controller => :articles
    end
  end

end
