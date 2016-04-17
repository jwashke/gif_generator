require 'rails_helper'

RSpec.feature "Admin can create categories" do
  context "As an admin" do
    scenario "With valid search terms" do
      gif_image_path = "www.fake_url.com"
      visit new_admin_category_path

      fill_in "Search", with: "Cat"
      click_on "Generate Gif"

      within ".category-name" do
        expect(page).to have_content("Cat")
      end
    end

    scenario "With invalid search terms" do
      visit new_admin_category_path

      click_on "Generate Gif"

      within ".flash-error" do
        expect(page).to have_content("Search can't be blank")
      end
    end
  end

  context "As a user" do
    scenario "cannot access new category page" do
      visit new_admin_category_path

    end
  end
end
