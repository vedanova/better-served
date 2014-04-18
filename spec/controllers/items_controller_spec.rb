require 'spec_helper'

describe ItemsController do
  login_user

  let(:item) { Item.make!}

  describe "GET 'index'" do
    it "returns http success" do
      get 'index', place_id: item.place.id
      response.should be_success
    end
  end

end
