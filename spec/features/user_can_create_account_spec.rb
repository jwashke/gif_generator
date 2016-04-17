require 'rails_helper'

RSpec.feature "User can create an account" do
  scenario "with valid params" do
    visit new_user_path

    fill_in "Username", with: "user"
    fill_in "Password", with: "password"
    click_on "Create Account"
    # save_and_open_page
    within ".welcome" do
      expect(page).to have_content("Welcome, user")
    end
  end

  scenario "with invalid params" do
    visit new_user_path

    fill_in "Username", with: "user"
    click_on "Create Account"

    within ".flash-error" do
      expect(page).to have_content("Password can't be blank")
    end
  end
end
