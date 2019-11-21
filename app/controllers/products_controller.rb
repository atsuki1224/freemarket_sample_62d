class ProductsController < ApplicationController
  def show
    @product = Product.find(params[:id])
    @images = @product.images.order("created_at ASC").limit(10)
  end
end
