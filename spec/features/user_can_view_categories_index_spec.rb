require 'rails_helper'

RSpec.feature "User can view categories index" do
  context "As a user" do
    scenario "I see the categories index" do
      Category.create(search: "Dog")

      visit categories_path

      within ".categories" do
        expect(page).to have_content("Dog")
      end
    end
  end

  context "As an admin" do
    scenario "I see the admin categories index" do
      admin = User.create(username: "admin",
                        password: "password",
                        role: 1)
      Category.create(search: "Dog")

      ApplicationController.any_instance.stubs(:current_user).returns(admin)
      visit admin_categories_path

      within ".categories" do
        expect(page).to have_content("Dog")
        expect(page).to have_content("Delete")
      end

      expect(page).to have_content("Create New Category")
    end
  end
end
