class ProductsController < ApplicationController
  def detail
    @product = Product.find(params[:id])
    @images = @product.images.order("created_at ASC").limit(10)
  end
end
