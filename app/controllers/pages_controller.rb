class PagesController < ApplicationController

  before_action :authenticate_user!, only: [:inside]

  def home
    redirect_to new_user_session_path
  end
  
  def inside
  end 
    
end
