class Item < ApplicationRecord
  validates :item_name,         presence: true
  validates :item_describe,     presence: true
  validates :item_price,        presence: true
  validates :item_category_id,  presence: true
  validates :item_show_id,      presence: true
  validates :item_delivary_id,  presence: true
  validates :perfecture_id,     presence: true
  validates :item_day_id,       presence: true
  validates :user,              presence: true, foreign_key: true

  belongs_to :user
  # has_one :order
end
