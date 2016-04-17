require 'rails_helper'

RSpec.feature "Admin can delete categories" do
  context "as an admin" do
    scenario "I can delete a category" do
      Category.create(search: "test")
      admin = User.create(username: "admin",
                        password: "password",
                        role: 1)

      ApplicationController.any_instance.stubs(:current_user).returns(admin)
      visit admin_categories_path

      click_link "Delete"
      expect(page).not_to have_content("test")
    end
  end
end
