require 'rails_helper'

RSpec.feature "Admin can create gifs" do
  context "As an admin" do
    scenario "I can create a gif" do
      gif_image_path = "http://media3.giphy.com/media/Feu1dGsQ7q4wg/giphy.gif"
      test = Category.create(search: "rabbit")
      admin = User.create(username: "admin",
                        password: "password",
                        role: 1)

      ApplicationController.any_instance.stubs(:current_user).returns(admin)
      visit admin_category_path(test)

      click_link "Generate Gif"

      expect(page).to have_content("Gif successfully created!")

    end
  end
end
