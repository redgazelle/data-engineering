require 'spec_helper'

describe PurchaseItem do

  before(:each) do
    @purchase = FactoryGirl.create(:purchase)
    @product = FactoryGirl.create(:product)
    @attr = {
      purchase_id: @purchase.id,
      product_id: @product.id,
      purchase_count: 5
    }
  end

  it "should create a new instance given a valid attribute" do
    PurchaseItem.create!(@attr)
  end

  describe "purchase validation" do

    it "should require a purchase" do
      no_purchase = PurchaseItem.new(@attr.merge(purchase_id: nil))
      no_purchase.should_not be_valid
    end

    it "should accept valid purchase" do
      valid_purchase = PurchaseItem.new(@attr.merge(purchase_id: @purchase.id))
      valid_purchase.should be_valid
    end

  end

  describe "product validation" do

    it "should require a product" do
      no_product = PurchaseItem.new(@attr.merge(product_id: nil))
      no_product.should_not be_valid
    end

    it "should accept valid product" do
      valid_product = PurchaseItem.new(@attr.merge(product_id: @product.id))
      valid_product.should be_valid
    end

  end

  describe "purchase count validation" do

    it "should require purchase count" do
      no_purchase_count = PurchaseItem.new(@attr.merge(purchase_count: nil))
      no_purchase_count.should_not be_valid
    end

    it "should accept valid name" do
      valid_purchase_count = PurchaseItem.new(@attr.merge(purchase_count: 10))
      valid_purchase_count.should be_valid
    end

  end
end