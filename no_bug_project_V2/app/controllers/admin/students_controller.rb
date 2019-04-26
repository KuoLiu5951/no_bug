class Admin::StudentsController < Admin::BaseController
  before_action :set_admin_student, only: [:show, :edit, :update, :destroy]

  def index
    @students = Student.all
  end

  def show
  end

  def new
    @student = Student.new
  end

  def edit
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to admin_student_path(@student), notice: 'student was successfully created.'
    else
      render :new
    end
  end

  def update
    if @student.update(student_params)
      redirect_to admin_student_path(@student), notice: 'student was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @student.destroy
    respond_to do |format|
      format.html { redirect_to admin_students_url, notice: 'student was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_admin_student
      @student = Student.find(params[:id])
    end

    def student_params
      params.require(:student).permit(:id, :name, :phone, :sex, :birth, :user_id, :email)
    end
end
