class User < ApplicationRecord
  validates :email, uniqueness: true, presence:true
  validates :password , length: { minimum: 7 }, presence:true, on: :create
  validates :password , length: { minimum: 7}, on: :update, allow_blank: true
  validates :firstname, presence:true
  validates :lastname, presence:true
  validates :firstname_kana, presence:true
  validates :lastname_kana, presence:true
  validates :nickname, presence:true
  validates :birthday, presence:true
  validates :total_profit, presence:true
  validates :point, presence:true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2, :facebook]

  has_many :products
  # has_many :nices
  # has_many :commnets
  # has_many :messages
  # has_many :buyer_userReview, class_name:”user_review”, foreign_key: :buyer_id
  # has_many :buyers, through: :buyer_userReview, source: :seller
  # has_many :seller_userReview, class_name:”user_review”, foreign_key: :seller_id
  # has_many :sellers, through: :seller_userReviews, source: :buyer
  has_many :trades 
  has_many :trade_products , through: :trades, source: :product
  has_one :credit_card
  has_one :card
  accepts_nested_attributes_for :card
  has_one :address
  accepts_nested_attributes_for :address
  has_one :sns_credential
  # accepts_nested_attributes_for :sns_credential


  def self.find_oauth(auth)
    uid = auth.uid
    provider = auth.provider
    snscredential = SnsCredential.where(uid: uid, provider: provider).first
    if snscredential.present?
      user = User.where(id: snscredential.user_id).first
    else
      user = User.where(email: auth.info.email).first
      if user.present?
        SnsCredential.create(
          uid: uid,
          provider: provider,
          user_id: user.id
          )
      else
        user = User.create(
          nickname: auth.info.name,
          email:    auth.info.email,
          password: Devise.friendly_token[0, 20]
          )
        SnsCredential.create(
          uid: uid,
          provider: provider,
          user_id: user.id
          )
      end
    end
    return user
  end

  def update_without_current_password(params, *options)
    params.delete(:current_password)

    if params[:password].blank? && params[:password_confirmation].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    end

    result = update_attributes(params, *options)
    clean_up_passwords
    result
  end
end
