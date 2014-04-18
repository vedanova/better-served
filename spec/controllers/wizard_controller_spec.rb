require 'spec_helper'

describe WizardController do
  login_user

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end


  describe 'GET start' do
    it 'should build a new premise with a place and an item' do
      get 'start'
      assigns(:premise).should be_a(Premise)
      assigns(:premise).places.first.should be_a(Place)
      assigns(:premise).places.first.items.first.should be_a(Item)
    end
  end

end
