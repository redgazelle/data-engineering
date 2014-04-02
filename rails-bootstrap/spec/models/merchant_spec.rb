require 'spec_helper'

describe Merchant do

  before(:each) do
    @attr = {
      name: "Example Merchant",
      address: "user@example.com"
    }
  end

  it "should create a new instance given a valid attribute" do
    Merchant.create!(@attr)
  end

  describe "name validation" do

    it "should require a name" do
      no_name_merchant = Merchant.new(@attr.merge(name: ''))
      no_name_merchant.should_not be_valid
    end

    it "should accept valid name" do
      valid_name_merchant = Merchant.new(@attr.merge(name: 'General Store'))
      valid_name_merchant.should be_valid
    end

  end

  describe "address validation" do

    it "should require an address" do
      no_address_merchant = Merchant.new(@attr.merge(address: ''))
      no_address_merchant.should_not be_valid
    end

    it "should accept valid address" do
      valid_address_merchant = Merchant.new(@attr.merge(address: '123 Merchant Street'))
      valid_address_merchant.should be_valid
    end

  end

end