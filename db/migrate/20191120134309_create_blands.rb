class CreateBlands < ActiveRecord::Migration[5.0]
  def change
    create_table :blands do |t|
      t.string :name
      t.integer :category_id
      t.timestamps
    end
    add_index :blands, :category_id
  end
end
