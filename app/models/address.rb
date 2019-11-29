class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  validates :zipcode, presence:true
  validates :prefecture_id, presence:true
  validates :city , presence:true
  validates :address, presence:true
  
  belongs_to_active_hash :prefecture
  belongs_to :user,optional: true
end