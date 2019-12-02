class CardController < ApplicationController
  require "payjp"

  def pay
    product = Product.find(params[:product_id])
    Trade.create(user_id:1, product_id: params[:product_id])
    product.update(trade_status:1)
    if 
      Trade.create(user_id:params[:user_id], product_id: params[:product_id]) && product.update(trade_status:1) 
      redirect_to root_path
    else
      confirmation_product_path(@product)
    end
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    charge = Payjp::Charge.create(
    :amount => product.price,
    :card => params['payjp-token'],
    :currency => 'jpy',
  )

  end

end