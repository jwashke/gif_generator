require 'rails_helper'

RSpec.feature "User can favorite gifs" do
  scenario "User can Favorite Gif" do
    gif_image_path = "http://media3.giphy.com/media/Feu1dGsQ7q4wg/giphy.gif"
    rabbit = Category.create(search: "rabbit")
    user = User.create(username: "user",
                      password: "password")
    rabbit.gifs.create(image_path: gif_image_path)

    ApplicationController.any_instance.stubs(:current_user).returns(user)
    visit categories_path

    click_link "rabbit"
    click_link "Favorite"
    expect(page).to have_content("rabbit")

  end

  scenario "User can unfavorite Gif" do
    gif_image_path = "http://media3.giphy.com/media/Feu1dGsQ7q4wg/giphy.gif"
    rabbit = Category.create(search: "rabbit")
    user = User.create(username: "user",
                      password: "password")
    rabbit.gifs.create(image_path: gif_image_path)

    ApplicationController.any_instance.stubs(:current_user).returns(user)
    visit categories_path

    click_link "rabbit"
    click_link "Favorite"

    click_link "Unfavorite"

    expect(page).not_to have_content("rabbit")

  end
end
