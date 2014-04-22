require 'spec_helper'

describe Request do

  describe 'push_msg' do
    it 'should push the message after creation' do
      r = Request.make
      r.should_receive(:push_msg)
      r.save!
    end
  end


end
