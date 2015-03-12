require 'rails_helper'

feature "Home Page" do
  scenario "viewing it" do
    visit "/"
    expect(page).to have_content 'Bug Catcher'
  end
end