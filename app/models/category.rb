class Category < ApplicationRecord
  has_many :products
  has_many :blands
  has_ancestry

  def self.sort_parents
      self.all.order("id ASC").limit(13)
  end
end
