class ApplicationController < ActionController::Base
  helper_method :current_student, :current_teacher

  def current_student
    current_user.student
  end

  def current_teacher
    current_user.teacher
  end

end
