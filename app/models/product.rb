class Product < ApplicationRecord
  has_many :images
  # has_many :commnets
  # has_many :messages
  # has_many :nices
  # belongs_to :user
  belongs_to :category
  belongs_to :bland
  has_one :trade
end
