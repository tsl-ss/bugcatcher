require 'test_helper'

class HomePageTest < ActionDispatch::IntegrationTest
  test "Viewing Home Page" do
    get "/"
    assert_response :success
  end
end
