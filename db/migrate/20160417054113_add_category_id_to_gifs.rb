class AddCategoryIdToGifs < ActiveRecord::Migration
  def change
      add_column :gifs, :category_id, :integer
  end
end
