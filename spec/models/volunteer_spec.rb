require 'spec_helper'

describe Volunteer do
  before :all do
    @meadows = create(:neighborhood)
  end

  it "is invalid without a neighborhood" do
    expect(build(:volunteer)).to be_invalid
  end

  it "can be assigned to a neighborhood" do
    clark = create(:volunteer, neighborhood: @meadows)
    expect(clark).to be_valid
    expect(clark).to be_valid
    expect(clark.first_name).to eq 'Clark'
    expect(clark.last_name).to eq 'Kent'
    expect(clark.neighborhood.name).to eq 'Meadowy Meadows'
  end

  it "can have a mobile number and company" do
    clark = create(:volunteer, is_mobile: true, company: "Daily Planet", neighborhood: @meadows)
    expect(clark.is_mobile).to be_truthy
    expect(clark.company).to eq "Daily Planet"
  end
end
