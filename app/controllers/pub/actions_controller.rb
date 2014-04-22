class Pub::ActionsController < ApplicationController
  layout 'pub'

  before_filter :find_item, only: :show

  def show
  end

  # protect from using back button to invoke action twice
  def back_protection
  end


  private

  def find_item
    @item = Item.where(uuid: params[:uuid]).first
    @place = @item.place
    @premise = @place.premise
  end

end
