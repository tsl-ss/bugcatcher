require 'test_helper'

class UserFlowsTest < ActionDispatch::IntegrationTest
  test "User - Registration Test" do
    get "/users/sign_up"
    post_via_redirect "/users", user: {email: 'user@email.com', password: '12345678', password_confirmation: '12345678'}
    assert_equal '/', path
    assert_equal 'Welcome! You have signed up successfully.', flash[:notice]
    get "/projects"
    assert_response :success
    assert assigns(:projects)
  end
end
