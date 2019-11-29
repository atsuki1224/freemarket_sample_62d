class ProductsController < ApplicationController

  def new
  end
  
  def show
    @product = Product.find(params[:id])
    @images = @product.images.order("created_at ASC").limit(10)
  end
  
  def confirmation
    @product = Product.find(params[:id])
  end

  require 'payjp'

  def purchase
    Payjp.api_key = "sk_test_cee4ee20cc4c2035c1e7b76d"
    Payjp::Charge.create(
      amount: 809, # 決済する値段
      card: params['payjp-token'], # フォームを送信すると作成・送信されてくるトークン
      currency: 'jpy'
    )
  end

end
