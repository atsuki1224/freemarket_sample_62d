class Card < ApplicationRecord
  validates :card_number, presence:true
  validates :validated_data , presence:true
  validates :security_code, presence:true

  belongs_to :user,optional: true
end
