# README

# users
|  column                 |  type       |  option                                      |
|  nickname               |  string     |  validates, presence: true                   |
|  email                  |  string     |  validates, presence: true                   |
|  password               |  string     |  validates, presence: true                   |
|  password_confirmation  |  string     |  validates, presence: true                   |
|  last_name              |  string     |  validates, presence: true                   |
|  first_name             |  string     |  validates, presence: true                   |
|  last_name_kana         |  string     |  validates, presence: true                   |
|  first_name_kana        |  string     |  validates, presence: true                   |
|  birthday_year          |  integer    |  validates, presence: true                   |
|  birthday_month         |  integer    |  validates, presence: true                   |
|  birthday_day           |  integer    |  validates, presence: true                   |

- user has_many: items


# items
|  column                 |  type       |  option                                        |
|  item_image             |  string     |  validates, presence: true                     |
|  item_name              |  string     |  validates, presence: true                     |
|  item_describe          |  string     |  validates, presence: true                     |
|  item_category          |  string     |  validates, presence: true                     |
|  item_condition         |  string     |  validates, presence: true                     |
|  delivery_charge        |  string     |  validates, presence: true                     |
|  delivery_local         |  string     |  validates, presence: true                     |
|  delivery_day           |  integer    |  validates, presence: true                     |
|  item_price             |  integer    |  validates, presence: true                     |
|  user_id                |  reference  |  validates, presence: true, foreign_key: true  |

- item belongs_to: user
- item has_one: chage


# charges
|  column                  |  type       |  option                                        |
|  post_number             |  integer    |  validates, presence: true                     |
|  prefecture              |  string     |  validates, presence: true                     |
|  municipalities          |  string     |  validates, presence: true                     |
|  address                 |  string     |  validates, presence: true                     |
|  building_name           |  string     |                                                |
|  phone_number            |  integer    |  validates, presence: true                     |

-belongs_to: item
-has_one: pay_jp


# pay_jps
|  column                 |  type       |  option                                         |
|  card_info              |  integer    |  validates, presence: true                      |
|  card_number            |  integer    |  validates, presence: true                      |
|  security_code          |  integer    |  validates, presence: true                      |

-belongs_to: payment
