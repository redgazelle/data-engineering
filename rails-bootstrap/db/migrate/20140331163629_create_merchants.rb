class CreateMerchants < ActiveRecord::Migration
  def change
    create_table :merchants do |t|
      t.string   :name
      t.string   :address

      t.timestamps
    end
    
    add_index :merchants, [:name, :address]
  end
end
