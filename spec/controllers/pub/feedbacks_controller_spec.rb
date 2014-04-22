require 'spec_helper'

describe Pub::FeedbacksController do

  let(:feedback_params) { {feedback: {content: 'Great food', email: 'f@foo.com'}} }
  let(:item) { Item.make! }

  describe "GET 'create'" do
    it "returns http success" do
      expect do
        get 'create', feedback_params.merge(item_id: item.id)
      end.to change(Feedback, :count).by(1)
      response.should be_success
      assigns(:item).should eq item
      assigns(:place).should eq item.place
      assigns(:premise).should eq item.place.premise
    end
  end

  describe "GET 'new'" do
    it "returns http success" do
      get 'new', item_id: item.id
      assigns(:feedback).should be_a(Feedback)
      response.should be_success
      assigns(:item).should eq item
      assigns(:place).should eq item.place
      assigns(:premise).should eq item.place.premise
    end
  end

end
