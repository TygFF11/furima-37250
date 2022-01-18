class SnsCredential < ApplicationRecord
  belongs_to :user, optional: true
  # validates :uid, uniqueness: true
end
