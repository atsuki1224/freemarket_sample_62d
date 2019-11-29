class AddzipcodeToAddress < ActiveRecord::Migration[5.0]
  def change
    add_column :addresses, :zipcode, :string, null: false
  end
end
