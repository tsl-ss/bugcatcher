require 'test_helper'

class UserFlowsTest < ActionDispatch::IntegrationTest

  test "User - Registration Test" do
    get "/users/sign_up"
    post_via_redirect "/users", user: {email: 'user@email.com', password: '12345678', password_confirmation: '12345678'}
    assert_equal '/projects', path
    assert_equal 'Welcome! You have signed up successfully.', flash[:notice]
    get "/projects"
    assert_response :success
    assert assigns(:projects)
  end

  test "Registered User - Login" do
    daniel = users :daniel
    post_via_redirect "/users/sign_in", user: {email: daniel.email, password: '12345678'}
    assert_equal '/projects', path
    assert_equal "Signed in successfully.", flash[:notice]
  end

 end

