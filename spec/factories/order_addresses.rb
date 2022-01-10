FactoryBot.define do
  factory :order_address do
    postal_code           {'123-4567'}
    prefecture_id         {3}
    urban_town_village    {'東京都'}
    village_address       {'青山1-1-1'}
    building_name         {'何とか'}
    phone_number          {'09088776655'}
    token                 {"tok_abcdefghijk00000000000000000"}
    association           :user
    association           :item
  end
end
