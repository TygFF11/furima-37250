class Info < ApplicationRecord
  validates :last_name,               format: { with: /\A[ぁ-ん一-龥]+\z/ }
  validates :last_name_kana,          format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :first_name,              format: { with: /\A[ぁ-ん一-龥]+\z/ }
  validates :first_name_kana,         format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :birthday,                presence: true

  belongs_to :user,                   optional: true
  
end
