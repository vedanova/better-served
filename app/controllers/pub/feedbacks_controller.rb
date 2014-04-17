class Pub::FeedbacksController < ApplicationController
  layout 'pub'

  before_filter :find_item, only: [:new, :create]

  def create
    @item.feedbacks.create(item_params)
  end

  def new
    @feedback = @item.feedbacks.build
  end

  protected

  def find_item
    @item = Item.where(id: params[:item_id]).first
    @place = @item.place
    @premise = @place.premise
  end

  def item_params
    params.require(:feedback).permit(:email, :content)
  end

end
