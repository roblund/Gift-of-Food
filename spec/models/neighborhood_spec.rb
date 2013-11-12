require 'spec_helper'

describe Neighborhood do
  before :all do
    @meadows = create(:neighborhood)
    @clark = create(:volunteer, neighborhood: @meadows)
  end

  it "can have its standard fields populated" do
    @meadows.should be_valid
    @meadows.name.should eq 'Meadowy Meadows'
    @meadows.file_id.should eq '2012_1'
    @meadows.drop_location.should eq 1
  end
end
