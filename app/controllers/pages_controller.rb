class PagesController < ApplicationController

  before_action :authenticate_user!, only: [:inside]

  def home
    if current_user
      redirect_to dashboard_index_path
    else
      redirect_to new_user_session_path
    end
  end
  
  def inside
  end 
    
end
