class Pub::ActionsController < ApplicationController
  layout 'pub'

  before_filter :find_item

  def show
    puts env.inspect
  end


  private

  def find_item
    @item = Item.where(uuid: action_params[:uuid]).first
    @place = @item.place
    @premise = @place.premise
  end

  def action_params
    params.permit(:uuid)
  end
end
