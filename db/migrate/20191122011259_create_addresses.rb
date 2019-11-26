class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.integer :prefecture_id,  null: false
      t.string :city,            null: false
      t.string :address,         null: false
      t.string :building_name,   null: true
      t.string :phone_number,    null: true
      t.integer :user_id,        null: false
      t.timestamps 
    end
  end
end
