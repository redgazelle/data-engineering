# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  description :string(255)
#  price       :decimal(, )
#  merchant_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Product < ActiveRecord::Base
  belongs_to :merchant

  validates :description, presence: true
  validates :price, presence: true, numericality: true
  validates :merchant, presence: true
end
