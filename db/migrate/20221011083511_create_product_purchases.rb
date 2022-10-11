class CreateProductPurchases < ActiveRecord::Migration[6.0]
  def change
    create_table :product_purchases do |t|
      t.string :post_code, null: false
      t.string :municipalities, null: false
      t.string :address, null: false
      t.string :building_name
      t.string :phone_number, null: false
      t.references :purchase_history, null: false, foreign_key: true
      t.integer :prefecture_id, null: false
      t.timestamps
    end
  end
end
