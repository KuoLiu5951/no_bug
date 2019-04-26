class Teacher::GradersController < Teacher::BaseController
  before_action :set_teacher_grader, only: [:show, :edit, :update, :destroy]

  def index
    @graders = current_teacher.graders.all
  end

  def show
  end

  def new
    @grader = current_teacher.graders.new
  end

  def edit
  end

  def create
    @grader = current_teacher.graders.new(grader_params)
    if @grader.save
      redirect_to teacher_grader_path(@grader), notice: 'grader was successfully created.'
    else
      render :new
    end
  end

  def update
    if @grader.update(grader_params)
      redirect_to teacher_grader_path(@grader), notice: 'grader was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @grader.destroy
    respond_to do |format|
      format.html { redirect_to teacher_graders_url, notice: 'grader was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_teacher_grader
      @grader = current_teacher.graders.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def grader_params
      params.require(:grader).permit(:id, :student_id, :project_id, :teacher_id)
    end
end
