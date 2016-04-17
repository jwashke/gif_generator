class Gif < ActiveRecord::Base
  belongs_to :category
  validates :image_path, presence: true, uniqueness: true
  validates :category_id, presence: true
end
