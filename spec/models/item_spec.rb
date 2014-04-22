require 'spec_helper'

describe Item do

  it 'should set a uuid on create' do
    Item.make!.uuid.should_not be_nil
  end

  it 'should create a qr ulr' do
    Item.make!.qr_data_url.should_not be_nil
  end


end
