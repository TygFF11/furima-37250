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
|  item_category_id       |  integer     |  null: false                     |
|  item_show_id           |  integer     |  null: false                     |
|  item_delivary_id       |  integer     |  null: false                     |
|  item_local_id          |  integer     |  null: false                     |
|  item_day_id            |  integer     |  null: false                     |
|  user                   |  references  |  null: false, foreign_key: true  |

- item belongs_to: user
- item has_many: addresses



# orders
|  column                 |  type        |  option                          |
|  user                   |  references  |  null: false, foreign_key: true  |
|  item                   |  references  |  null: false, foreign_key: true  |

- order belongs_to: user
- order belongs_to: item


# addresses
|  postal_code            |  type        |  option                          |
|  prefectural_id         |  integer     |  null: false                     |
|  urban_town_village     |  string      |  null: false                     |
|  village_address        |  string      |  null: false                     |
|  building_name          |  string      |                                  |
|  phone_numbe            |  string      |  null: false                     |
|  order                  |  references  |  null: false, foreign_key: true  |


