class Order < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one    :address

  # validates :user,          presence: true, foreign_key: true
  # validates :item,          presence: true, foreign_key: true

end
