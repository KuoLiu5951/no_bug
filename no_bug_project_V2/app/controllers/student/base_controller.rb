class Student::BaseController < ApplicationController
  before_action :check_student_user!

  private

  def check_student_user!
    # if current_user && current_user.is_teacher && current_user.is_admin
    #   redirect_to root_path, notice: "No permission, please contact administrator"
    # end
  end

end
