require 'test_helper'

class Admin::GradersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_grader = admin_graders(:one)
  end

  test "should get index" do
    get admin_graders_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_grader_url
    assert_response :success
  end

  test "should create admin_grader" do
    assert_difference('Admin::Grader.count') do
      post admin_graders_url, params: { admin_grader: {  } }
    end

    assert_redirected_to admin_grader_url(Admin::Grader.last)
  end

  test "should show admin_grader" do
    get admin_grader_url(@admin_grader)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_grader_url(@admin_grader)
    assert_response :success
  end

  test "should update admin_grader" do
    patch admin_grader_url(@admin_grader), params: { admin_grader: {  } }
    assert_redirected_to admin_grader_url(@admin_grader)
  end

  test "should destroy admin_grader" do
    assert_difference('Admin::Grader.count', -1) do
      delete admin_grader_url(@admin_grader)
    end

    assert_redirected_to admin_graders_url
  end
end
