class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :products, presence: true
  validates :products_explanation, presence: true
  validates :category_id, presence: true
  validates :state_id, presence: true
  validates :delivery_charge_id, presence: true
  validates :region_id, presence: true
  validates :shipping_date_id, presence: true
  validates :price, presence: true
  validates :image, presence: true
  
end
