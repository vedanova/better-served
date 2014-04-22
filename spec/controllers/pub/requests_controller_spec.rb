require 'spec_helper'

describe Pub::RequestsController do

  before do
    Request.any_instance.stub(:push_msg)
    @item = Item.make!
  end


  describe "GET 'create'" do
    it "returns http success" do
      expect do
      post 'create', type: 'Order', item_id: @item.id
      end.to change(Request, :count).by(1)
      response.should redirect_to(request_path(assigns(:request)))
    end
  end

  describe "GET 'show'" do
    it "returns http success" do
      get 'show', id: @item.id
      response.should be_success
    end
  end

end
