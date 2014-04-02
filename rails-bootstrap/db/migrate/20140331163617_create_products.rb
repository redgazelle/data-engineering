class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string   :description
      t.decimal  :price
      t.integer  :merchant_id

      t.timestamps
    end
    
    add_index :products, [:description, :price, :merchant_id]
  end
end
