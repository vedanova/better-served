class ItemsController < ApplicationController

  before_filter :authenticate_user!
  before_filter :setup_place, only: [:index]

  def index
    @items = @place.items
  end

  def show
  end

  def create
  end

  def delete
  end

  def update
  end

  protected

  def setup_place
    #TODO restrict to user
    @place = Place.find(params[:place_id])
  end

  def item_attributes
    params[:item].permit(:id)
  end

end
