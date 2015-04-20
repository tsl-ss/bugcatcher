require 'test_helper'

class ProjectsControllerTest < ActionController::TestCase

  def test_get_index
    Project.destroy_all
    p = Project.create!(owner: users(:daniel), name: "Google", description: "Search")

    get :index
    assert_response :success
    assert_equal [p], assigns(:projects).to_a
  end

  def test_get_show
    p = projects(:lantern)
    get :show, id: p.id
    assert_response :success
    assert_equal p, assigns(:project)
    assert assigns(:screenshots)
  end

  def test_post_create_successful
    logo = fixture_file_upload('files/project_logo.png', 'image/png')
    screen1 = fixture_file_upload('files/project_screenshot.png', 'image/png')

    sign_in_as_daniel

    assert_difference('Project.count') do
      post(:create, { project: {
        name: "Google",
        logo: logo,
        description: "The search engine!",
        screenshots_attributes: [{image: screen1}]
      }})
    end

    assert_equal 1, assigns(:project).screenshots.count
    assert_includes users(:daniel).projects, assigns(:project)
    assert_redirected_to project_path(assigns(:project))
    assert_response :redirect
  end

  def test_post_create_failure
    sign_in_as_daniel

    assert_no_difference('Project.count') do
      post(:create, { project: { name: nil }})
    end

    assert_template :new
    assert_template "shared/_error_messages"
  end

  def test_get_new
    sign_in_as_daniel
    get :new
    assert_response :success
    assert assigns(:project).new_record?
  end

  def test_get_edit
    p = projects(:lantern)
    sign_in_as_daniel
    get :edit, {id: p.id}
    assert_response :success
    assert_equal(p, assigns(:project))
  end

  def test_patch_update_successfully
    p = projects(:lantern)
    sign_in_as_daniel
    patch :update, { id: p.id, project: { name: "Cool" }}
    p.reload
    assert_response :redirect
    assert_equal "Cool", p.name
    assert_equal "Project was successfully updated.", flash[:notice]
  end

  def test_patch_update_failure
    p = projects(:lantern)
    sign_in_as_daniel
    patch :update, { id: p.id, project: { name: nil }}
    p.reload
    assert_template :edit
    assert_template "shared/_error_messages"
    assert("Cool" != p.name)
  end

  def test_patch_update_can_delete_logo
    p = projects(:lantern)
    logo = fixture_file_upload('files/project_logo.png', 'image/png')
    sign_in_as_daniel
    patch :update, { id: p.id, project: {name: "Cool", logo: logo}}
    assert_match 'project_logo.png', assigns(:project).logo.url

    patch :update, { id: p.id, delete_logo: "1", project: {name: "Cool"}}
    assert_match "default_logo.png", assigns(:project).logo.url
    assert_response :redirect
  end

  def test_delete_destroy
    p = projects(:lantern)
    sign_in_as_daniel

    assert_difference('Project.count', -1) do
      delete :destroy, { id: p.id }
    end

    assert_response :redirect
  end

end