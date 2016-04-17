class User < ActiveRecord::Base
  has_secure_password
  has_many :favorites
  has_many :gifs, through: :favorites
  has_many :categories, through: :gifs
  validates :username, presence: true, uniqueness: true

  enum role: [:default, :admin]

  def gifs_by_category(category)
    gifs.where(category: category)
  end

  def my_categories
    categories.uniq
  end
end
