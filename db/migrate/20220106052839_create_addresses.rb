class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string     :postal_code,         presence: true
      t.integer    :prefecture_id,       presence: true
      t.string     :urban_town_village,  presence: true
      t.string     :village_address,     presence: true
      t.string     :building_name
      t.string     :phone_number,        presence: true
      t.references :order,               presence: true, foreign_key: true
      t.timestamps
    end
  end
end
