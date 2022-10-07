class CommodityExhibition < ApplicationRecord
  with_options presence: true do
    validates :item_name
    validates :explanation
    validates :selling_price
  end

  with_options presence: true, numericality: { other_than: 1 }
    validates :detail_category_id
    validates :detail_situation_id
    validates :delivery_charge_id
    validates :prefecture_id
    validates :days_to_ship_id
  end

  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to : detail_category
  belongs_to : detail_situation
  belongs_to : delivery_charge
  belongs_to : prefecture
  belongs_to : days_to_ship

end
