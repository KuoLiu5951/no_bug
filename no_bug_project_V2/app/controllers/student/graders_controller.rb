class Student::GradersController < Student::BaseController
  before_action :set_student_grader, only: [:show, :edit, :update, :destroy]

  def index
    @graders = current_student.graders.all
  end

  def show
  end

  def new
    @grader = current_student.graders.new
  end

  def edit
  end

  def create
    @grader = current_student.graders.new(grader_params)
    if @grader.save
      redirect_to student_grader_path(@grader), notice: 'grader was successfully created.'
    else
      render :new
    end
  end

  def update
    if @grader.update(grader_params)
      redirect_to student_grader_path(@grader), notice: 'grader was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @grader.destroy
    respond_to do |format|
      format.html { redirect_to student_graders_url, notice: 'grader was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student_grader
      @grader = current_student.graders.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def grader_params
      params.require(:grader).permit(:id, :is_published)
    end
end
