class Admin::TeachersController < Admin::BaseController
  before_action :set_admin_teacher, only: [:show, :edit, :update, :destroy]

  def index
    @teachers = Teacher.all
  end

  def show
  end

  def new
    @teacher = Teacher.new
  end

  def edit
  end

  def create
    @teacher = Teacher.new(teacher_params)
    if @teacher.save
      redirect_to admin_teacher_path(@teacher), notice: 'teacher was successfully created.'
    else
      render :new
    end
  end

  def update
    if @teacher.update(teacher_params)
      redirect_to admin_teacher_path(@teacher), notice: 'teacher was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @teacher.destroy
    respond_to do |format|
      format.html { redirect_to admin_teachers_url, notice: 'teacher was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_teacher
      @teacher = Teacher.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def teacher_params
      params.require(:teacher).permit(:id, :name, :phone, :sex, :birth, :user_id, :email)
    end
end
