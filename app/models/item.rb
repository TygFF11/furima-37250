class Item < ApplicationRecord
  
  validates :item_name,         presence: true
  validates :item_describe,     presence: true
  validates :item_price,        presence: true

  validates :item_category_id,  numericality: { other_than: 1, message: "can't be blank"}
  validates :item_show_id,      numericality: { other_than: 1, message: "can't be blank"}
  validates :item_delivary_id,  numericality: { other_than: 1, message: "can't be blank"}
  validates :perfecture_id,     numericality: { other_than: 1, message: "can't be blank"}
  validates :item_day_id,       numericality: { other_than: 1, message: "can't be blank"}
  
  validates :user,              presence: true, foreign_key: true
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item_category
  belongs_to :item_day
  belongs_to :item_delivary
  belongs_to :item_show
  belongs_to :perfecture

#   belongs_to :user
#   has_one :order

end
