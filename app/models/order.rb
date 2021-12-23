class Order < ApplicationRecord

  validates :user,          presence: true, foreign_key: true
  validates :item,          presence: true, foreign_key: true

  belongs_to :user
  belongs_to :item
  has_one    :address

  
end
