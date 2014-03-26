class WizardController < ApplicationController

  before_filter :authenticate_user!


  def index
  end

  def step1
    @premise = Premise.new
  end

end
