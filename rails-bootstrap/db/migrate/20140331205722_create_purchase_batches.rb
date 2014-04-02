class CreatePurchaseBatches < ActiveRecord::Migration
  def change
    create_table :purchase_batches do |t|
      t.string  :state, default: 'initialized'

      t.timestamps
    end
  end
end
