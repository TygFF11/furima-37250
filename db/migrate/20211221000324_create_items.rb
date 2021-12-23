class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string        :item_name,         null: false
      t.text          :item_describe,     null: false
      t.integer       :item_price,        null: false
      t.integer       :item_category_id,  null: false
      t.integer       :item_show_id,      null: false
      t.integer       :item_delivary_id,  null: false
      t.integer       :perfecture_id,     null: false
      t.integer       :item_day_id,       null: false
      t.references    :user,              null: false, foreign_key: true
      t.timestamps    null: false
    end
  end
end
