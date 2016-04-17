class CategoriesController < ApplicationController

  def show
    @category = Category.find(params[:search])
  end

  def index
    @categories = Category.all
  end

end
