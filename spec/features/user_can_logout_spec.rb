require 'rails_helper'

RSpec.feature "User can logout" do
  scenario "clicks logout link" do
    User.create(username: "user", password: "password")

    visit login_path

    fill_in "Username", with: "user"
    fill_in "Password", with: "password"
    click_button "Login"

    click_link "Logout"

    within ".nav" do
      expect(page).to have_content("Login")
    end
    #save_and_open_page
    within ".flash-notice" do
      expect(page).to have_content("Successfully Logged out")
    end
  end
end
