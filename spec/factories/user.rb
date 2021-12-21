FactoryBot.define do
  factory :user do
    nickname            {}
    email               {}
    encrypted_password  {}
    last_name           {}
    first_name          {}
    last_name_kana      {}
    first_name_kana     {}
  end
end