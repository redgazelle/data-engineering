# == Schema Information
#
# Table name: purchasers
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Purchaser < ActiveRecord::Base
  has_many :purchases, dependent: :destroy

  validates :name, presence: true
end
