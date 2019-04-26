class Teacher::ProjectsController < Teacher::BaseController
  before_action :set_teacher_project, only: [:show, :edit, :update, :destroy]

  def index
    @projects = current_teacher.projects
  end

  def show
  end

  def new
    @project = current_teacher.projects.new
  end

  def edit
  end

  def create
    @project = current_teacher.projects.new(project_params)
    if @project.save
      redirect_to teacher_project_path(@project), notice: 'Project was successfully created.'
    else
      render :new
    end
  end

  def update
    if @project.update(project_params)
      redirect_to teacher_project_path(@project), notice: 'Project was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to teacher_projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_teacher_project
      @project = current_teacher.projects.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:id, :name, :start_on, :finish_on, :teacher_name)
    end
end
