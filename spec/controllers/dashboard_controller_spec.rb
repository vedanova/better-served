require 'spec_helper'

describe DashboardController do
  login_user

  describe "GET 'index'" do
    context 'new user' do
      it "should redirect me to the wizard if I am a new user" do
        get 'index'
        response.should redirect_to wizard_index_path
      end
    end

    context 'already set up' do
      it "should render the dashboard" do
        Premise.make!
        get 'index'
        response.should be_success
      end
    end
  end
end
