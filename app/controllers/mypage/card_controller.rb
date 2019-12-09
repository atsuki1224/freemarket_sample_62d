class Mypage::CardController < CardController
  require "payjp"
  before_action :user_signed_in_check
  before_action :user_selected
  before_action :get_payjp_info, only: [:update, :show]
  
  def show
    card = current_user.credit_card
    if card.present?
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end

  def edit
  end

  def update
    if params['payjp-token'].blank?
      redirect_to action: "edit", id: current_user.id
    else
      customer = Payjp::Customer.create(
      email: current_user.email,
      card: params['payjp-token'],
      metadata: {user_id: current_user.id}
      )
      @card = CreditCard.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to action: "show"
      else
        redirect_to action: "edit", id: current_user.id
      end
    end
  end

  private
  def user_selected
    @user = User.find(current_user.id)
  end

  def user_signed_in_check
    redirect_to user_session_path unless user_signed_in?
  end

  def get_payjp_info
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
  end
end
