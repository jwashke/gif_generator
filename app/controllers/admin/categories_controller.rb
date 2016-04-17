class Admin::CategoriesController < Admin::BaseController
  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to category_path(@category)
    else
      flash.now[:error] = @category.errors.full_messages.join(", ")
      render :new
    end
  end

  private

  def category_params
    params.require(:category).permit(:search)
  end
end
