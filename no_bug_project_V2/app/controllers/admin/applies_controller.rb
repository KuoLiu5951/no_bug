class Admin::AppliesController < Admin::BaseController
  before_action :set_admin_apply, only: [:show, :edit, :update, :destroy]

  def index
    @applies = Apply.all
  end

  def show
  end

  def new
    @apply = Apply.new
  end

  def edit
  end

  def create
    @apply = Apply.new(apply_params)
    if @apply.save
      redirect_to admin_apply_path(@apply), notice: 'Apply was successfully created.'
    else
      render :new
    end
  end

  def update
    if @apply.update(apply_params)
      redirect_to admin_apply_path(@apply), notice: 'Apply was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @apply.destroy
    respond_to do |format|
      format.html { redirect_to admin_applies_url, notice: 'Apply was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_apply
      @apply = Apply.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def apply_params
      params.require(:apply).permit(:id, :is_published)
    end
end
