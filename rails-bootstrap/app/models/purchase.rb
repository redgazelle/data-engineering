# == Schema Information
#
# Table name: purchases
#
#  id                :integer          not null, primary key
#  purchase_batch_id :integer
#  purchaser_id      :integer
#  created_at        :datetime
#  updated_at        :datetime
#

class Purchase < ActiveRecord::Base
  belongs_to :purchaser
  has_many :purchase_items, dependent: :destroy

  validates :purchaser, presence: true

  def total_purchase_cost
    purchase_items.map(&:total_purchase_cost).sum
  end
end
