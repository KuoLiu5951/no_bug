class Admin::BaseController < ApplicationController
  before_action :check_admin_user!

  private

  def check_admin_user!
    unless current_user && current_user.is_admin
      redirect_to root_path, notice: "No permission, please contact administrator"
    end
  end

end
