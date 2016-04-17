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

  def index
    @categories = Category.all
  end

  def destroy
    Category.destroy(params[:search])
    redirect_to admin_categories_path
  end

  private

  def category_params
    params.require(:category).permit(:search)
  end
end
