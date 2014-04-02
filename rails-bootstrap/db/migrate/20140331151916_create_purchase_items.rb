class CreatePurchaseItems < ActiveRecord::Migration
  def change
    create_table :purchase_items do |t|
      t.integer  :purchase_id
      t.integer  :product_id
      t.integer  :purchase_count, default: 1

      t.timestamps
    end
    
    add_index :purchase_items, :purchase_id
  end
end
