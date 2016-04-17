require 'rails_helper'

RSpec.feature "Admin can create categories" do
  context "as an admin" do
    scenario "with valid search terms" do
      gif_image_path = "www.fake_url.com"
      admin = User.create(username: "admin",
                        password: "password",
                        role: 1)

      ApplicationController.any_instance.stubs(:current_user).returns(admin)
      visit new_admin_category_path

      fill_in "Search", with: "Cat"
      click_on "Create Category"

      within ".category-name" do
        expect(page).to have_content("Cat")
      end
    end

    scenario "with invalid search terms" do
      admin = User.create(username: "admin",
                        password: "password",
                        role: 1)

      ApplicationController.any_instance.stubs(:current_user).returns(admin)
      visit new_admin_category_path

      click_on "Create Category"

      within ".flash-error" do
        expect(page).to have_content("Search can't be blank")
      end
    end
  end

  context "as a non admin user" do
    scenario "cannot access new category page" do
      user = User.create(username: "user",
                        password: "password")

      ApplicationController.any_instance.stubs(:current_user).returns(user)
      visit new_admin_category_path

      within ".dialog" do
        expect(page).to have_content("The page you were looking for doesn't exist.")
      end
    end
  end
end
