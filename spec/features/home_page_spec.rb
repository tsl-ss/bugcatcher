require 'rails_helper'
feature "Home Page" do
  background do

  end

  scenario "viewing it" do
    visit '/'
    within(".projects") do
      fill_in 'Email', :with => 'user@example.com'
      fill_in 'Password', :with => 'caplin'
    end

    expect(page.find('.projects')).to have_content 'Project #1'
  end
end