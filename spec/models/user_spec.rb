require 'spec_helper'

describe User do

  describe '#role' do
    it 'should set the role if it is blank' do
      user = User.make
      user.role = nil
      user.save!
      user.role.should eq User::OWNER_ROLE
    end
  end

end