class ChangeDataTradeStatusToProducts < ActiveRecord::Migration[5.0]
  def change
    change_column :products,:trade_status,:integer
    change_column :products,:size,:integer
    change_column :products,:delivery_charge,:integer
    # change_column :products,:delivery_methot,:integer
    change_column :products,:delivery_area,:integer
    change_column :products,:delivery_time,:integer
    # rename_column :products, :delivery_methot ,:delivery_method

  end
end
