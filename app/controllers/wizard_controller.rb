class WizardController < ApplicationController
  respond_to :json
  before_filter :authenticate_user!

  def index
  end

  def start
    @premise = Premise.new
    @premise.places.build
    @premise.places[0].items.build
  end

  def setup
    p = wizard_params
    p.merge!(organisation: current_user.organisation)
    item_attr = p[:places_attributes]["0"].delete(:items)
    Premise.transaction do
      @premise = Premise.create(p)
      if @premise.persisted?
        binding.pry
        @place = @premise.reload.places.first
        item_attr['item_count'].to_i.times do |n|
          @place.items.create!(name: "#{item_attr[:name]}-#{n}")
        end
        respond_with(@place)
      else
        respond_with(@premise, status: 500)
      end
    end
  end

  private

  def wizard_params
    params.require(:premise).permit(:name, :description, places_attributes: [:name, :description, items: [:name, :item_count]])
  end

end
