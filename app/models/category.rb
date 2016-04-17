class Category < ActiveRecord::Base
  validates :search, presence: true, uniqueness: true
  has_many :gifs
end
