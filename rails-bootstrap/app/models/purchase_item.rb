# == Schema Information
#
# Table name: purchase_items
#
#  id             :integer          not null, primary key
#  purchase_id    :integer
#  product_id     :integer
#  purchase_count :integer          default(1)
#  created_at     :datetime
#  updated_at     :datetime
#

class PurchaseItem < ActiveRecord::Base
  belongs_to :purchase
  belongs_to :product

  validates :purchase, presence: true
  validates :product, presence: true
  validates :purchase_count, presence: true, numericality: { only_integer: true }

  def total_purchase_cost
    product.price * purchase_count
  end
end
