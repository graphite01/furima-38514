class PurchaseHistory < ApplicationRecord
  belongs_to :user
  belongs_to :commodity_exhibition
  has_one :product_purchase
end
