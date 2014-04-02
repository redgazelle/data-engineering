require 'spec_helper'

describe Purchaser do

  before(:each) do
    @attr = {
      name: "Example Merchant"
    }
  end

  it "should create a new instance given a valid attribute" do
    Purchaser.create!(@attr)
  end

  describe "name validation" do

    it "should require a name" do
      no_name_purchaser = Purchaser.new(@attr.merge(name: ''))
      no_name_purchaser.should_not be_valid
    end

    it "should accept valid name" do
      valid_name_purchaser = Purchaser.new(@attr.merge(name: 'Sam Spade'))
      valid_name_purchaser.should be_valid
    end

  end

end