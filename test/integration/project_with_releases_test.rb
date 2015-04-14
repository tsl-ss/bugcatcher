require 'test_helper'

class ProjectWithReleasesTest < ActionDispatch::IntegrationTest

  # test "Project - an user creates a new project" do
  #   # User Login
  #   daniel = users :daniel
  #   post_via_redirect "/users/sign_in", user: {email: daniel.email, password: '12345678'}

  #   # create the project
  #   post_via_redirect "/projects", project: { name: "LanternHQ", url: 'https://lanternhq.com', description: 'LanternHQ - Teach your best class' }
  #   assert_response :success
  #   project = Project.find_by_name!('LanternHQ')
  #   assert_equal "/projects/#{project.id}", path
  #   assert assigns(:project)
  # end

  # test "View a project" do
  #   project = projects :lantern
  #   get "/projects/#{project.id}"
  #   assert_equal assigns(:project), project
  # end

end
