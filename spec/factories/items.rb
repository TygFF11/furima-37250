FactoryBot.define do
  factory :item do
    item_name           {Faker::Name.name}
    item_describe       {Faker::Lorem.sentence}
    item_price          {300}
    
    item_category_id     {3}
    item_show_id         {3}
    item_delivary_id     {2}
    perfecture_id        {2}
    item_day_id          {2}
    

    after(:build) do |item|
      item.image.attach(io: File.open('public/test2.png'), filename: 'test2.png')
    end

    association :user
    
  end
end
