class TradeController < ApplicationController

  def create
    product = Product.find(params[:product_id])
    Trade.create(user_id:1, product_id: params[:product_id])
    product.update(trade_status:1)
    redirect_to root_path
  end
end