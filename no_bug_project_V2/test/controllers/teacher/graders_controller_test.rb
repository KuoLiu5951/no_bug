require 'test_helper'

class Teacher::GradersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @teacher_grader = teacher_graders(:one)
  end

  test "should get index" do
    get teacher_graders_url
    assert_response :success
  end

  test "should get new" do
    get new_teacher_grader_url
    assert_response :success
  end

  test "should create teacher_grader" do
    assert_difference('Teacher::Grader.count') do
      post teacher_graders_url, params: { teacher_grader: {  } }
    end

    assert_redirected_to teacher_grader_url(Teacher::Grader.last)
  end

  test "should show teacher_grader" do
    get teacher_grader_url(@teacher_grader)
    assert_response :success
  end

  test "should get edit" do
    get edit_teacher_grader_url(@teacher_grader)
    assert_response :success
  end

  test "should update teacher_grader" do
    patch teacher_grader_url(@teacher_grader), params: { teacher_grader: {  } }
    assert_redirected_to teacher_grader_url(@teacher_grader)
  end

  test "should destroy teacher_grader" do
    assert_difference('Teacher::Grader.count', -1) do
      delete teacher_grader_url(@teacher_grader)
    end

    assert_redirected_to teacher_graders_url
  end
end
