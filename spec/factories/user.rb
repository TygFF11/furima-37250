FactoryBot.define do
  factory :user do
    nickname                { Faker::Name.name }
    email                   { Faker::Internet.free_email }
    password                { 'aaa111' }
    password_confirmation   { password }
    last_name               { '漢字' }
    first_name              { 'ひらがな' }
    last_name_kana          { 'カンジ' }
    first_name_kana         { 'ヒラガナ' }
    birthday                { '1930-01-01' }
    
    # association :item
    # association :order
  end
end
