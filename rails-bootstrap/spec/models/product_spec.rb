require 'spec_helper'

describe Product do

  before(:each) do
    @merchant = FactoryGirl.create(:merchant)
    @attr = {
      description: "running shoes",
      price: 50.0,
      merchant_id: @merchant.id
    }
  end

  it "should create a new instance given a valid attribute" do
    Product.create!(@attr)
  end

  describe "description validation" do

    it "should require a description" do
      no_description_product = Product.new(@attr.merge(description: ''))
      no_description_product.should_not be_valid
    end

    it "should accept valid description" do
      valid_description_product = Product.new(@attr.merge(description: 'dozen eggs for $1'))
      valid_description_product.should be_valid
    end

  end

  describe "price validation" do

    it "should require a price" do
      no_price_product = Product.new(@attr.merge(price: ''))
      no_price_product.should_not be_valid
    end

    it "should accept valid price" do
      valid_price_product = Product.new(@attr.merge(price: 1.0))
      valid_price_product.should be_valid
    end

  end

end