class CreatePurchaseHistories < ActiveRecord::Migration[6.0]
  def change
    create_table :purchase_histories do |t|
      t.references :user, null: false, foreign_key: true
      t.references :commodity_exhibition, null: false, foreign_key: true
      t.timestamps
    end
  end
end
