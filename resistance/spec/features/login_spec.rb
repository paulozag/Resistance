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
end