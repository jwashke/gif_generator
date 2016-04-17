class Admin::GifsController < Admin::BaseController
  def create
    @category = Category.find(params[:category])
    @giphy ||= GiphyRequest.new
    image_path = @giphy.request(@category.search)
    @gif = @category.gifs.new(image_path: image_path)
    if @gif.save
      flash[:notice] = "Gif successfully created!"
    else
      flash[:error] = "Something went wrong"
    end
    redirect_to admin_category_path(@category)
  end
end
