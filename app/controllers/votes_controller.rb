class VotesController < ApplicationController
  def new 
    @vote = Vote.new
  end

  def create
    @vote = Vote.new(params[:vote])
#    if current_user.votes.count.equal?(0)
#      @user_rating = UserCategoryRating.new
#    else
#      @user_rating = UserCategoryRating.find_all_by_user_id(current_user)
#    end
    #@user_rating = UserCategoryRating.new
    @vote.user_id = current_user.id

    #@article = Article.find(@vote.article_id)
    #@user_rating.category_id = @vote.article.category_id
    #@user_rating.user_id = @vote.user_id

    if @vote.save
      #@user_rating.rating = current_user.votes.average('value')
      #@user_rating.save
      flash[:notice] = "Your vote has been submitted successfully"
      redirect_to article_path(@vote.article)
    else
      flash[:error] = "You have already voted for this article!"
      redirect_to article_path(@vote.article)
    end
  end

  def edit
    @vote = Vote.find(params[:id])
  end

  def update
    @vote = Vote.find(params[:id])

     if @vote.update_attributes(params[:vote])
       flash[:notice] = "Your vote has been updated!" 
      redirect_to article_path(@vote.article)
     else
      redirect_to article_path(@vote.article)
    end
  end

end
