require 'test_helper'

class Teacher::StudentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @teacher_student = teacher_students(:one)
  end

  test "should get index" do
    get teacher_students_url
    assert_response :success
  end

  test "should get new" do
    get new_teacher_student_url
    assert_response :success
  end

  test "should create teacher_student" do
    assert_difference('Teacher::Student.count') do
      post teacher_students_url, params: { teacher_student: {  } }
    end

    assert_redirected_to teacher_student_url(Teacher::Student.last)
  end

  test "should show teacher_student" do
    get teacher_student_url(@teacher_student)
    assert_response :success
  end

  test "should get edit" do
    get edit_teacher_student_url(@teacher_student)
    assert_response :success
  end

  test "should update teacher_student" do
    patch teacher_student_url(@teacher_student), params: { teacher_student: {  } }
    assert_redirected_to teacher_student_url(@teacher_student)
  end

  test "should destroy teacher_student" do
    assert_difference('Teacher::Student.count', -1) do
      delete teacher_student_url(@teacher_student)
    end

    assert_redirected_to teacher_students_url
  end
end
