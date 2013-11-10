require 'spec_helper'

describe Volunteer do
  before :all do
    @meadows = create(:neighborhood)
  end

  it "is invalid without a neighborhood" do
    build(:volunteer).should be_invalid
  end

  it "can be assigned to a neighborhood" do
    clark = create(:volunteer, neighborhood: @meadows)
    clark.should be_valid
    clark.first_name.should eq 'Clark'
    clark.last_name.should eq 'Kent'
    clark.neighborhood.name.should eq 'Meadowy Meadows'
  end

  it "can have a mobile number and company" do
    clark = create(:volunteer, is_mobile: true, company: "Daily Planet", neighborhood: @meadows)
    clark.is_mobile.should be_true
    clark.company.should eq "Daily Planet"
  end
end
