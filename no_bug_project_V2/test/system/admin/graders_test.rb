require "application_system_test_case"

class Admin::GradersTest < ApplicationSystemTestCase
  setup do
    @admin_grader = admin_graders(:one)
  end

  test "visiting the index" do
    visit admin_graders_url
    assert_selector "h1", text: "Admin/Graders"
  end

  test "creating a Grader" do
    visit admin_graders_url
    click_on "New Admin/Grader"

    click_on "Create Grader"

    assert_text "Grader was successfully created"
    click_on "Back"
  end

  test "updating a Grader" do
    visit admin_graders_url
    click_on "Edit", match: :first

    click_on "Update Grader"

    assert_text "Grader was successfully updated"
    click_on "Back"
  end

  test "destroying a Grader" do
    visit admin_graders_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Grader was successfully destroyed"
  end
end
