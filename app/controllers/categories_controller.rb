class CategoriesController < ApplicationController
  def index
    @category = Category.find(:all)
  end

  def new
    @category = Category.new
  end
  

  def create
    @category = Category.new(params[:category])
    if @category.save
      flash[:notice] = "Your category as been created!"
      redirect_to "http://0.0.0.0:3000/categories"
    else
      redirect_to "http://0.0.0.0:3000/categories"

    end
  end

  def delete
   @category =  Category.find(params[:id])
   if @category.destroy
     flash[:notice] = "Category deleted sucessfully"
     redirect_to "http://0.0.0.0:3000/categories"
   else
     flash[:notice] = "Category could not be deleted"
     redirect_to "http://0.0.0.0:3000/categories"

   end
  end

end
