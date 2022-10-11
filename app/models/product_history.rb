class ProductHistorys
  include ActiveModel::Model
  attr_accessor :post_code, :municipalities, :address, :building_name, :phone_number, :purchase_history, :prefecture_id, :user_id, :commodity_exhibition_id, :token

  with_options presence: true do
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Enter it as follows (e.g. 123-4567)"}
    validates :municipalities
    validates :address
    validates :phone_number,  format: {with: /\A[0-9]{10,11}\z/, message: "is invalid. Input only number"}
    validates :token
  end
  
  with_options presence: true, foreign_key: true do
    validates :user_id
    validates :commodity_exhibition_id
  end

  validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}

end