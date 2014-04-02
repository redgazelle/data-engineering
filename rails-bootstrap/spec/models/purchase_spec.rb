require 'spec_helper'

describe Purchase do

  before(:each) do
    @purchaser = FactoryGirl.create(:purchaser)
    @attr = {
      purchaser_id: @purchaser.id
    }
  end

  it "should create a new instance given a valid attribute" do
    Purchase.create!(@attr)
  end

  describe "purchaser validation" do

    it "should require a purchaser" do
      no_purchaser = Purchase.new(@attr.merge(purchaser_id: nil))
      no_purchaser.should_not be_valid
    end

    it "should accept valid purchaser" do
      valid_purchaser = Purchase.new(@attr.merge(purchaser_id: @purchaser.id))
      valid_purchaser.should be_valid
    end

  end

end