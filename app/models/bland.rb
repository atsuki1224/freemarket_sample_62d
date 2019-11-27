class Bland < ApplicationRecord

  has_many:products
  belongs_to:category,optional:true

  scope :search_name, ->(name){ where('name LIKE ?',name)}

end
