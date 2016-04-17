require 'rails_helper'

RSpec.feature "User can login" do
  scenario "with valid params" do
    User.create(username: "user", password: "password")

    visit login_path

    fill_in "Username", with: "user"
    fill_in "Password", with: "password"
    click_button "Login"

    within ".nav" do
      expect(page).to have_content("Logout")
    end
    within ".flash-notice" do
      expect(page).to have_content("Welcome, user")
    end
  end

  scenario "with invalid params" do
    User.create(username: "user", password: "password")

    visit login_path

    fill_in "Username", with: "user"
    fill_in "Password", with: "notpassword"
    click_button "Login"

    within ".nav" do
      expect(page).to have_content("Login")
    end
    #save_and_open_page
    within ".flash-error" do
      expect(page).to have_content("Invalid Login")
    end
  end
end
