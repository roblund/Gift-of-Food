require 'spec_helper'

describe Neighborhood do
  before :all do
    @meadows = create(:neighborhood)
    @clark = create(:volunteer, neighborhood: @meadows)
  end

  it "can have its standard fields populated" do
    expect(@meadows).to be_valid
    expect(@meadows.name).to eq 'Meadowy Meadows'
    expect(@meadows.file_id).to eq '2012_1'
    expect(@meadows.drop_location).to eq 1
  end
end
