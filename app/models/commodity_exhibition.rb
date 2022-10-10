class CommodityExhibition < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :detail_category
  belongs_to :detail_situation
  belongs_to :delivery_charge
  belongs_to :prefecture
  belongs_to :days_to_ship
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :item_name, length: { maximum: 40 }
    validates :explanation, length: { maximum: 1000 }
    validates :image
  end

  with_options presence: true, numericality: { other_than: 1, message: "cant't be blank" } do
    validates :detail_category_id
    validates :detail_situation_id
    validates :delivery_charge_id
    validates :prefecture_id
    validates :days_to_ship_id
  end

  validates :selling_price,
            numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: ' is out of setting range' }, allow_blank: true
  validates :selling_price, presence: true
end
