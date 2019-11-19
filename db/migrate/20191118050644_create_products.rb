class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :item_name ,        null: false
      t.text :description ,        null: false
      t.integer :item_condition ,  null: false
      t.string :trade_status ,    null: false
      t.string :size ,             null: true
      t.integer :bland_id ,        null: true
      t.integer :category_id ,     null: false
      t.string :delivery_charge ,  null: false
      t.string :delivery_methot ,  null: false
      t.string :delivery_area ,    null: false
      t.string :delivery_time ,    null: false
      t.integer :price ,           null: false
      t.integer :user_id ,        null: false , foreign_key: true
      t.timestamps
    end
  end
end
