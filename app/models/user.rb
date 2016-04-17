require 'rails_helper'

class User < ActiveRecord::Base
  has_secure_password
  validates :username, presence: true, uniqueness: true
end
