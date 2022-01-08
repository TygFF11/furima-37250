# README

# users
|  column                 |  type        |  option                          |
|  nickname               |  string      |  null: false                     |
|  email                  |  string      |  null: false, unique: true       |
|  encrypted_password     |  string      |  null: false                     |
|  last_name              |  string      |  null: false                     |
|  first_name             |  string      |  null: false                     |
|  last_name_kana         |  string      |  null: false                     |
|  first_name_kana        |  string      |  null: false                     |
|  birthday               |  date        |  null: false                     |

- user has_many: items
- user has_many: orders


# items
|  column                 |  type        |  option                          |
|  item_name              |  string      |  null: false                     |
|  item_describe          |  text        |  null: false                     |
|  item_price             |  integer     |  null: false                     |
|  item_category_id       |  integer     |  null: false                     |
|  item_show_id           |  integer     |  null: false                     |
|  item_delivary_id       |  integer     |  null: false                     |
|  prefecture_id          |  integer     |  null: false                     |
|  item_day_id            |  integer     |  null: false                     |
|  user                   |  references  |  null: false, foreign_key: true  |

- item belongs_to: user
- item has_one: order


# orders
|  column                 |  type        |  option                          |
|  user                   |  references  |  null: false, foreign_key: true  |
|  item                   |  references  |  null: false, foreign_key: true  |

- order belongs_to: user
- order belongs_to: item
- order has_one: address


# addresses
|  column                 |  type        |  option                          |
|  postal_code            |  string      |  null: false                     |
|  prefecture_id          |  integer     |  null: false                     |
|  urban_town_village     |  string      |  null: false                     |
|  village_address        |  string      |  null: false                     |
|  building_name          |  string      |                                  |
|  phone_number           |  string      |  null: false                     |
|  order                  |  references  |  null: false, foreign_key: true  |

- address bolongs_to: order
