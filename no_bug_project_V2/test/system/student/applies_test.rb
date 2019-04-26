require "application_system_test_case"

class Student::AppliesTest < ApplicationSystemTestCase
  setup do
    @student_apply = student_applies(:one)
  end

  test "visiting the index" do
    visit student_applies_url
    assert_selector "h1", text: "Student/Applies"
  end

  test "creating a Apply" do
    visit student_applies_url
    click_on "New Student/Apply"

    click_on "Create Apply"

    assert_text "Apply was successfully created"
    click_on "Back"
  end

  test "updating a Apply" do
    visit student_applies_url
    click_on "Edit", match: :first

    click_on "Update Apply"

    assert_text "Apply was successfully updated"
    click_on "Back"
  end

  test "destroying a Apply" do
    visit student_applies_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Apply was successfully destroyed"
  end
end
