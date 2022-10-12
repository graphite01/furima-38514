class ProductHistory
  include ActiveModel::Model
  attr_accessor :post_code, :municipalities, :address, :building_name, :phone_number, :purchase_history, :prefecture_id, :user_id, :commodity_exhibition_id, :token

  with_options presence: true do
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Enter it as follows (e.g. 123-4567)"}
    validates :municipalities
    validates :address
    validates :phone_number,  format: {with: /\A[0-9]{10,11}\z/, message: "is invalid. Input only number"}
    validates :user_id
    validates :commodity_exhibition_id
    validates :token
  end
  
  validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}

  def save
    purchase_history = PurchaseHistory.create(user_id: user_id, commodity_exhibition_id: commodity_exhibition_id)
    ProductPurchase.create(post_code: post_code, municipalities: municipalities, address: address, building_name: building_name, phone_number: phone_number, prefecture_id: prefecture_id, purchase_history_id: purchase_history.id)
  end
end