class CardController < ApplicationController
  require "payjp"
  before_action :get_payjp_info, only: [:pay, :create, :delete, :show]
  
  def create
    if params['payjp-token'].blank?
      redirect_to card_confirmation_path
    else
      customer = Payjp::Customer.create(
        email: session[:email],
        card: params['payjp-token']
      )
      session[:customer_id] = customer.id
      session[:card_id] = customer.default_card
      redirect_to complete_path
    end
  end

  def pay
    product = Product.find(params[:product_id])
    user = User.find(params[:id])
    profit = user.total_profit + product.price
    if 
      Trade.create(user_id:current_user.id, product_id: params[:product_id]) && product.update(trade_status:1) && product.user.update(total_profit: profit) 
      redirect_to root_path
    else
      confirmation_product_path(product)
    end
    
    # Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    charge = Payjp::Charge.create(
    :amount => product.price,
    :card => params['payjp-token'],
    :currency => 'jpy',
    )
  end

  def destroy
    card = current_user.credit_card
    if card.present?
      customer = Payjp::Customer.retrieve(card.customer_id)
      customer.delete
      card.delete
    end
      redirect_to card_mypage_index_path
  end

  private
  def get_payjp_info
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
  end

end