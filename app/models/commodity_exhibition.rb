class CommodityExhibition < ApplicationRecord
  with_options presence: true do
    validates :item_name
    validates :explanation
    validates :image
  end

  with_options presence: true, numericality: { other_than: 1 } do
    validates :detail_category_id
    validates :detail_situation_id
    validates :delivery_charge_id
    validates :prefecture_id
    validates :days_to_ship_id
  end

  with_options presence: true, format: { with: /\A[0-9]+\z/, message: ' is invalid. Input half-width characters'}, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: ' is out of setting range'} do
    validates :selling_price, presence: { message: "cant't be blank" }
  end

  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions do
    belongs_to :detail_category
    belongs_to :detail_situation
    belongs_to :delivery_charge
    belongs_to :prefecture
    belongs_to :days_to_ship
  end
end
