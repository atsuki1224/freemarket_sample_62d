class CardController < ApplicationController
  require "payjp"
  
  def new
    card = Card.where(user_id: current_user.id)
    redirect_to action: "show" if card.exists?
  end

  def pay
    product = Product.find(params[:product_id])
    Trade.create(user_id:1, product_id: params[:product_id])
    product.update(trade_status:1)

    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    charge = Payjp::Charge.create(
    :amount => product.price,
    :card => params['payjp-token'],
    :currency => 'jpy',
  )
  redirect_to root_path
  end

end