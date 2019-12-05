class ProductTsSetDefaltToProduct < ActiveRecord::Migration[5.0]
  def change
    change_column :products, :trade_status, :integer ,null: false, default: 0
  end
end
