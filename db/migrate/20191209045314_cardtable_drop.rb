class CardtableDrop < ActiveRecord::Migration[5.0]
  def change
    drop_table :cards do |t|
      t.string :card_number,     null: false
      t.string :validated_data,  null: false
      t.integer :security_code,  null: false
      t.integer :user_id,        null: false, foreign_key: true
      t.timestamps null: false
    end
  end
end
