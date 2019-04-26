require 'test_helper'

class Admin::AppliesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_apply = admin_applies(:one)
  end

  test "should get index" do
    get admin_applies_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_apply_url
    assert_response :success
  end

  test "should create admin_apply" do
    assert_difference('Admin::Apply.count') do
      post admin_applies_url, params: { admin_apply: {  } }
    end

    assert_redirected_to admin_apply_url(Admin::Apply.last)
  end

  test "should show admin_apply" do
    get admin_apply_url(@admin_apply)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_apply_url(@admin_apply)
    assert_response :success
  end

  test "should update admin_apply" do
    patch admin_apply_url(@admin_apply), params: { admin_apply: {  } }
    assert_redirected_to admin_apply_url(@admin_apply)
  end

  test "should destroy admin_apply" do
    assert_difference('Admin::Apply.count', -1) do
      delete admin_apply_url(@admin_apply)
    end

    assert_redirected_to admin_applies_url
  end
end
