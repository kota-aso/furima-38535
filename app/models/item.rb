class Item < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item_category
  belongs_to :item_status
  belongs_to :shipping_charger
  belongs_to :prefecture
  belongs_to :days_to_ship
  has_one_attached :image
  belongs_to :user

  validates :item_name, :item_description, :image,  presence: true

  validates :price, presence: true, numericality: {only_integer: true, greater_than: 300, less_than: 9999999}

  validates :item_category_id, :item_status_id, :shipping_charger_id, :prefecture_id, :days_to_ship_id,  numericality: { other_than: 1 } 


end
