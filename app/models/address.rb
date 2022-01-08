class Address < ApplicationRecord
  belongs_to :order

  # validates :postal_code,         presence: true
  # validates :prefecture_id,       presence: true
  # validates :urban_town_village,  presence: true
  # validates :village_address,     presence: true
  # validates :phone_number,        presence: true
  # validates :order,               presence: true, foreign_key: true

end
