require 'test_helper'

class Teacher::ProjectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @teacher_project = teacher_projects(:one)
  end

  test "should get index" do
    get teacher_projects_url
    assert_response :success
  end

  test "should get new" do
    get new_teacher_project_url
    assert_response :success
  end

  test "should create teacher_project" do
    assert_difference('Teacher::Project.count') do
      post teacher_projects_url, params: { teacher_project: {  } }
    end

    assert_redirected_to teacher_project_url(Teacher::Project.last)
  end

  test "should show teacher_project" do
    get teacher_project_url(@teacher_project)
    assert_response :success
  end

  test "should get edit" do
    get edit_teacher_project_url(@teacher_project)
    assert_response :success
  end

  test "should update teacher_project" do
    patch teacher_project_url(@teacher_project), params: { teacher_project: {  } }
    assert_redirected_to teacher_project_url(@teacher_project)
  end

  test "should destroy teacher_project" do
    assert_difference('Teacher::Project.count', -1) do
      delete teacher_project_url(@teacher_project)
    end

    assert_redirected_to teacher_projects_url
  end
end
