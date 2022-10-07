class CreateCommodityExhibitions < ActiveRecord::Migration[6.0]
  def change
    create_table :commodity_exhibitions do |t|
      t.string :item_name, null: false
      t.text :explanation, null: false
      t.integer :selling_price, null: false
      t.references :user, null: false, foreign_key: true
      t.integer :detail_category_id, null: false
      t.integer :detail_situation_id, null: false
      t.integer :delivery_charge_id, null: false
      t.integer :prefectures, null: false
      t.integer :days_to_ship, null: false
      t.timestamps
    end
  end
end
