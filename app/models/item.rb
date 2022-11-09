class Item < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item_category
  belongs_to :item_status
  belongs_to :shipping_charger
  belongs_to :prefecture
  belongs_to :days_to_ship

  validates :item_name, :item_description, :price, :user, : presence: true

  validates :item_category, :item_status, :shipping_charger, :prefecture, :days_to_ship,  numericality: { other_than: 1 } 


end
