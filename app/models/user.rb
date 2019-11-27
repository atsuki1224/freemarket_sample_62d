class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # has_many :porducts
  # has_many :nices
  # has_many :commnets
  # has_many :messages
  # has_many :buyer_userReview, class_name:”user_review”, foreign_key: :buyer_id
  # has_many :buyers, through: :buyer_userReview, source: :seller
  # has_many :seller_userReview, class_name:”user_review”, foreign_key: :seller_id
  # has_many :sellers, through: :seller_userReviews, source: :buyer
  has_one :card
  accepts_nested_attributes_for :card
  has_one :address
  accepts_nested_attributes_for :address
end
