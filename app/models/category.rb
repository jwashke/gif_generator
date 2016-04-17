class Category < ActiveRecord::Base
  validates :search, presence: true, uniqueness: true
end
