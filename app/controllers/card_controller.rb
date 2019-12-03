class CardController < ApplicationController

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
    
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]

    charge = Payjp::Charge.create(
    :amount => product.price,
    :card => params['payjp-token'],
    :currency => 'jpy',
    )
    
  end
end