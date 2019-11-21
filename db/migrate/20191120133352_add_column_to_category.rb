class AddColumnToCategory < ActiveRecord::Migration[5.0]
  def change
    add_column :categories, :ancestry, :string
    add_index :categories, :ancestry
  end

  def down
    remove_index :categories, :ancestry
    remove_index :categories, :ancestry
  end
end
