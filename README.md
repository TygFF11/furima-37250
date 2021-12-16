# README

# users
|  column                 |  type        |  option                          |
|  nickname               |  string      |  null: false                     |
|  email                  |  string      |  null: false                     |
|  encrypted_password     |  string      |  null: false, unique: true       |
|  last_name              |  string      |  null: false                     |
|  first_name             |  string      |  null: false                     |
|  last_name_kana         |  string      |  null: false                     |
|  first_name_kana        |  string      |  null: false                     |
|  birthday               |  date        |  null: false                     |

- user has_many: items
- user has_one: order


# items
|  column                 |  type        |  option                          |
|  item_name              |  string      |  null: false                     |
|  item_describe          |  text        |  null: false                     |
|  item_price             |  integer     |  null: false                     |
|  item_fee               |  integer     |  null: false                     |
|  item_profit            |  integer     |  null: false                     |
|  user                   |  references  |  null: false, foreign_key: true  |

- item belongs_to: user
- item has_one: charge
- item has_one: addresse


# orders
|  column                 |  type        |  option                          |
|  item_price             |  integer     |  null: false                     |
|  user                   |  references  |  null: false, foreign_key: true  |
|  item                   |  references  |  null: false, foreign_key: true  |

- charge belongs_to: user
- charge belongs_to: item


# addresses
|  postal_code            |  type        |  option                          |
|  prefectural            |  string      |  null: false                     |
|  urban_town_village     |  string      |  null: false                     |
|  village_address        |  string      |  null: false                     |
|  building_name          |  string      |  null: false                     |
|  phone_numbe            |  string      |  null: false                     |
|  order                  |  references  |  null: false, foreign_key: true  |

- addresse belongs_to: item
