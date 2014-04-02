class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.integer :purchase_batch_id
      t.integer :purchaser_id

      t.timestamps
    end
    
    add_index :purchases, :purchaser_id
    add_index :purchases, :purchase_batch_id
  end
end
