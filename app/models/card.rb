class Card < ApplicationRecord
  validates :card_number, length: { is: 16 },presence:true
  validates :validated_data, presence:true
  validates :security_code, length: { maximum: 4 }, presence:true

  belongs_to :user,optional: true
end
