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
- user has_one: charge


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
- item has_one: sold_out


# charges
|  column                 |  type        |  option                          |
|  item_price             |  integer     |  null: false                     |
|  user                   |  references  |  null: false, foreign_key: true  |
|  item                   |  references  |  null: false, foreign_key: true  |

- charge belongs_to: user
- charge belongs_to: item


# sold_outs
|  column                 |  type        |  option                          |
|  buyer                  |  string      |  null: false                     |
|  seller                 |  string      |  null: false                     |
|  item_category          |  string      |  null: false                     |
|  item_condition         |  string      |  null: false                     |
|  delivery_charge        |  string      |  null: false                     |
|  delivery_local         |  string      |  null: false                     |
|  delivery_day           |  integer     |  null: false                     |

- belongs_to: item
