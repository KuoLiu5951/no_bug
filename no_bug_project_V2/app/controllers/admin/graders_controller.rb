class Admin::GradersController < Admin::BaseController
  before_action :set_admin_grader, only: [:show, :edit, :update, :destroy]

  def index
    @graders = Grader.all
  end

  def show
  end

  def new
    @grader = Grader.new
  end

  def edit
  end

  def create
    @grader = Grader.new(grader_params)
    if @grader.save
      redirect_to admin_grader_path(@grader), notice: 'grader was successfully created.'
    else
      render :new
    end
  end

  def update
    if @grader.update(grader_params)
      redirect_to admin_grader_path(@grader), notice: 'grader was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @grader.destroy
    respond_to do |format|
      format.html { redirect_to admin_graders_url, notice: 'grader was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_grader
      @grader = Grader.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def grader_params
      params.require(:grader).permit(:id, :is_published)
    end
end
