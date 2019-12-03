class AddSnsCredentialTable < ActiveRecord::Migration[5.0]
    def change
      create_table :sns_credentials do |t|
        t.string :provider, null: false
        t.string :uid, null: false
        t.integer :user_id, null: false
        t.timestamps
      end
    end
  end
  