class CreateTrades < ActiveRecord::Migration[5.0]
  def change
    create_table :trades do |t|
      t.integer :user_id,  null: false ,foreign_key: true
      t.integer :product_id,  null: false ,foreign_key: true
      t.belongs_to :product
      t.timestamps
    end
  end
end
