class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,                presence: true
  validates :email,                   presence: true

  validates :password,                format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
  validates :password_confirmation,   format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
  validates :nickname,                presence: true

  validates :last_name,               format: { with: /\A[ぁ-ん一-龥]+\z/ }
  validates :last_name_kana,          format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :first_name,              format: { with: /\A[ぁ-ん一-龥]+\z/ }
  validates :first_name_kana,         format: { with: /\A[ァ-ヶー－]+\z/ }

  validates :birthday,                presence: true

  # has_many :items
  # has_many :orders
end
