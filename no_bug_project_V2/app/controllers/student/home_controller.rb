class Student::HomeController < Student::BaseController
  def index
  end

  def profile
    return if params[:student].blank?
    if current_student.update(profile_params)
      redirect_to student_root_path, notice: 'Profile was successfully updated.'
    else
      redirect_to student_root_path, notice: 'Profile was failed updated.'
    end
  end

  def profile_params
    params.require(:student).permit(:name, :phone, :sex, :birth, :free_day,:start_free_time, :expired_free_time, :email)
  end

end
