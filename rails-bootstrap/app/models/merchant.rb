# == Schema Information
#
# Table name: merchants
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  address    :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Merchant < ActiveRecord::Base
  has_many :products, dependent: :destroy

  validates :name, presence: true
  validates :address, presence: true
end
