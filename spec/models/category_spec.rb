require 'rails_helper'

RSpec.describe Category, type: :model do
  it { is_expected.to validate_presence_of :search }
  it { is_expected.to validate_uniqueness_of :search }
end
