class Student::AppliesController < Student::BaseController
  before_action :set_student_apply, only: [:show, :edit, :update, :destroy]

  def index
    @applies = current_student.applies
  end

  def show
  end

  def new
    @apply = current_student.applies.new
  end

  def edit
  end

  def create
    @apply = current_student.applies.new(apply_params)
    if @apply.save
      redirect_to student_apply_path(@apply), notice: 'Apply was successfully created.'
    else
      render :new
    end
  end

  def update
    if @apply.update(apply_params)
      redirect_to student_apply_path(@apply), notice: 'Apply was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @apply.destroy
    respond_to do |format|
      format.html { redirect_to student_applies_url, notice: 'Apply was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student_apply
      @apply = Apply.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def apply_params
      params.require(:apply).permit(:id, :is_published, :student_id, :project_id, :teacher_id)
    end
end
