class DashboardController < ApplicationController

  before_filter :new_user

  def index
  end


  private

  def new_user
    redirect_to wizard_index_path unless current_user.setup_finished?
  end

end
