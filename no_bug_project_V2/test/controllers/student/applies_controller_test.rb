require 'test_helper'

class Student::AppliesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @student_apply = student_applies(:one)
  end

  test "should get index" do
    get student_applies_url
    assert_response :success
  end

  test "should get new" do
    get new_student_apply_url
    assert_response :success
  end

  test "should create student_apply" do
    assert_difference('Student::Apply.count') do
      post student_applies_url, params: { student_apply: {  } }
    end

    assert_redirected_to student_apply_url(Student::Apply.last)
  end

  test "should show student_apply" do
    get student_apply_url(@student_apply)
    assert_response :success
  end

  test "should get edit" do
    get edit_student_apply_url(@student_apply)
    assert_response :success
  end

  test "should update student_apply" do
    patch student_apply_url(@student_apply), params: { student_apply: {  } }
    assert_redirected_to student_apply_url(@student_apply)
  end

  test "should destroy student_apply" do
    assert_difference('Student::Apply.count', -1) do
      delete student_apply_url(@student_apply)
    end

    assert_redirected_to student_applies_url
  end
end
