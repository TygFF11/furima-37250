class Item < ApplicationRecord
  
  validates :item_name,         presence: true
  validates :item_describe,     presence: true
  validates :item_price,        format: { with:/\A[0-9]+\z/ }, numericality: { less_than_or_equal_to: 9999999,
  greather_than_or_equal_to: 300}

  validates :item_category_id,  numericality: { other_than: 1, message: "can't be blank"}
  validates :item_show_id,      numericality: { other_than: 1, message: "can't be blank"}
  validates :item_delivary_id,  numericality: { other_than: 1, message: "can't be blank"}
  validates :perfecture_id,     numericality: { other_than: 1, message: "can't be blank"}
  validates :item_day_id,       numericality: { other_than: 1, message: "can't be blank"}

  validates :image,             presence: true

  # validates :user,              presence: true, foreign_key: true
  
  belongs_to :user
  # has_one :order
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item_category
  belongs_to :item_day
  belongs_to :item_delivary
  belongs_to :item_show
  belongs_to :perfecture

end
