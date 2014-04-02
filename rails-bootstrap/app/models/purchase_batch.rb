# == Schema Information
#
# Table name: purchase_batches
#
#  id         :integer          not null, primary key
#  state      :string(255)      default("initialized")
#  created_at :datetime
#  updated_at :datetime
#

require 'csv'

class PurchaseBatch < ActiveRecord::Base
  has_many :purchases

  attr_accessor :import_errors

  def self.create_from_file(file)
    purchase_batch = PurchaseBatch.create
    import_errors = []

    CSV.foreach(file, headers: true, converters: :numeric, col_sep: "\t", skip_blanks: true) do |row|

      merchant = Merchant.find_or_create_by(name: row['merchant name'], address: row['merchant address'])
      
      product = Product.find_or_create_by(description: row['item description'], price: row['item price'], merchant_id: merchant.id)
      
      purchaser = Purchaser.find_or_create_by(name: row['purchaser name'])
      
      purchase = Purchase.create( purchase_batch_id: purchase_batch.id, purchaser_id: purchaser.id )

      purchase_item = purchase.purchase_items.create({ product_id: product.id, purchase_count: row['purchase count'] })

      [merchant, product, purchaser, purchase, purchase_item].each do |o|
        import_errors << "#{o.class.name}: #{o.errors.full_messages}" if o.errors.present?
      end
    end

    purchase_batch.import_errors = import_errors.flatten.join(', ')
    purchase_batch.update(state: import_errors.present? ? 'failed' : 'complete')
    purchase_batch
  end

  def gross_revenue
    purchases.map(&:total_purchase_cost).sum
  end

  def complete?
    state == 'complete'
  end

end
