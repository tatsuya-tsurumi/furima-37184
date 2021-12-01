class Item < ApplicationRecord
  belongs_to :user
  has_one :purchase_record

  has_one_attached :image

  validates :products, presence: true
  validates :products_explanation, presence: true
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :state_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :delivery_charge_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :region_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_date_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :price, presence: true, numericality: { only_integer: true,
                                                    greater_than: 299, less_than: 10_000_000 }
  validates :image, presence: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :delivery_charge
  belongs_to :region
  belongs_to :shipping_date
end
