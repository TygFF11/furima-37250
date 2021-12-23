FactoryBot.define do
  factory :user do
    nickname                {Faker::Name.name}
    email                   {Faker::Internet.free_email}

    # password                {Faker::Internet.password(min_length: 6)}
    # password_confirmation   {password}

    # last_name               {Faker::Name.last_name}
    # first_name              {Faker::Name.first_name}
    # last_name_kana          {last_name}
    # first_name_kana         {first_name}

    password                {'aaa111'}
    password_confirmation   {password}

    last_name               {'漢字'}
    first_name              {'ひらがな'}
    last_name_kana          {'カンジ'}
    first_name_kana         {'ヒラガナ'}

    birthday                {'1930-01-01'}
    # association :item
    # association :order

  end
end