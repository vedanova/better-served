class Pub::RequestsController < ApplicationController
  layout 'pub'

  def create
    @request = Request.new(type: params[:type], item_id: params[:item_id])

    respond_to do |format|
      if @request.save
        format.html { redirect_to request_path(@request) }
        format.json { render json: @request, status: :created, location: @request }
      else
        format.html { render action: "new" }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

end
