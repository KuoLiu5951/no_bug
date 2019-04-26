class Teacher::BaseController < ApplicationController
  before_action :check_teacher_user!

  private

  def check_teacher_user!
    unless current_user && current_user.is_teacher
      redirect_to root_path, notice: "No permission, please contact administrator"
    end
  end

end
