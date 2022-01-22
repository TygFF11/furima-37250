class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

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
  
  has_many :sns_credentials
  
  has_many :items
  has_many :orders

  def self.from_omniauth(auth)
    sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_create
    user = User.where(email: auth.info.email).first_or_initialize(
      nickname: auth.info.name,
      email: auth.info.email
    )
    if user.persisted?
      sns.user = user
      sns.save
    end
    { user: user, sns: sns }
  end

end
