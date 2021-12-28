class Item < ApplicationRecord
  
  validates :item_name,         presence: true
  validates :item_describe,     presence: true
  validates :item_price,        numericality: { less_than_or_equal_to: 9999999,greather_than_or_equal_to: 300, only_integer: true}

  validates :item_category_id,  numericality: { other_than: 1, message: "can't be blank"}
  validates :item_show_id,      numericality: { other_than: 1, message: "can't be blank"}
  validates :item_delivary_id,  numericality: { other_than: 1, message: "can't be blank"}
  validates :perfecture_id,     numericality: { other_than: 1, message: "can't be blank"}
  validates :item_day_id,       numericality: { other_than: 1, message: "can't be blank"}

  validates :image,             presence: true

  
  belongs_to :user
  # has_one :order
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :item_category
  belongs_to_active_hash :item_day
  belongs_to_active_hash :item_delivary
  belongs_to_active_hash :item_show
  belongs_to_active_hash :perfecture

end
