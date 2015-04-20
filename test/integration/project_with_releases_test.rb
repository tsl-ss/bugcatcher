require 'test_helper'

class ProjectWithReleasesTest < ActionDispatch::IntegrationTest

  def test_user_can_add_a_project_and_then_add_a_release
    daniel = users :daniel

    # SIGN IN
    post_via_redirect "/users/sign_in", user: { email: daniel.email, password: '12345678'}
    assert_equal "/projects", path

    # CREATE PROJECT
    post_via_redirect "/projects", project: {
      name: "LanternHQ",
      url: 'https://lanternhq.com',
      description: 'LanternHQ - Teach your best class'
    }

    assert_response :success
    project = Project.find_by_name!('LanternHQ')
    assert_equal "/projects/#{project.id}", path
    assert assigns(:project)

    # CREATE RELEASE
    post_via_redirect "/projects/#{project.id}/releases", release: {
      title: "Release 1",
      description: "New version..."
    }

    assert_response :success
    release = project.releases.find_by_title!('Release 1')
    assert_equal "/projects/#{project.id}/releases/#{release.id}", path
    assert assigns(:release)
  end

end
