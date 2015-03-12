require 'rails_helper'

feature "Signing Up" do
  scenario "As a new user from the home page" do
    visit "/"
    within "#signup-form" do
      fill_in "username", with: 'marcus'
      fill_in "password", with: '12345678'
      click_button 'Get Started'
    end
    expect(page).to have_content("Welcome")
  end

  scenario "As a new user from the user/sign_up url" do
    visit "/users/sign_up"
    within "#new_user" do
      fill_in "Email", with: 'myemail@company.com'
      fill_in "Password", with: '12345678'
      fill_in "Password Confirmation", with: '12345678'
      click_button 'Sign up'
    end

    visit '/profile'
    expect(page).to have_content("Welcome")
  end
end
