require 'spec_helper'

describe Place do

  it 'should set a uuid' do
    Place.make!.uuid.should_not be_nil
  end

end
