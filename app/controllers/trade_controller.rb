class TradeController < ApplicationController

  def create
    product = Product.find(params[:product_id])
    # transactionテーブルを作る
    Trade.create(user_id:1, product_id: params[:product_id])
    #プロダクトテーブルを探してトレードステータスを２に変更
    product.update(trade_status:2)
    redirect_to root_path
  end
end