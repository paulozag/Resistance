require 'rails_helper'
RSpec.feature "Logging In" do
  let!(:user) { User.create(name: "user1", password: "user1")}

  scenario "an existing user can sign in" do
    visit "/"
    click_link "sign in"

    fill_in "name", with: "user1"
    fill_in "password", with: "user1"
    click_button "login"

    expect(page).to have_content("games index")
  end

  scenario "a new user can create an account" do
    visit "/"
    click_link "sign up"

    fill_in "Name", with: "user2"
    fill_in "Password", with: "user2"
    click_button "Create User"

    expect(page).to have_content("games index")
  end
end