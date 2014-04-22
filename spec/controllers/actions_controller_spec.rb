require 'spec_helper'

describe Pub::ActionsController do

  before do
    @item = Item.make!
  end

  describe "GET 'show'" do
    it "returns http success" do
      get 'show', uuid: @item.uuid
      assigns(:item).should eq @item
      assigns(:place).should eq @item.place
      assigns(:premise).should eq @item.place.premise
      response.should be_success
    end
  end

  describe '#back protection' do
    it 'should returns success' do
      get 'back_protection', premise_id: @item.uuid
      response.should be_success
    end
  end

end
