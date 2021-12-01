class PurchaseRecordShippingAdress
  include ActiveModel::model
  attr_accessor :postal_code, :prefecture_id, :city, :block, :building, :phone_number, :user_id, :item_id

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :block
    validates :phone_number
  end
  validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
end