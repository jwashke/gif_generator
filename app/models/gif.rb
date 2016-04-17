class Gif < ActiveRecord::Base
  validates :image_path, presence: true, uniqueness: true
  validates :category_id, presence: true
end
