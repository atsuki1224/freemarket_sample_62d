class ProductsController < ApplicationController

  def new
  end
  
  def show
    @product = Product.find(params[:id])
    @images = @product.images.order("created_at ASC").limit(10)
  end

end
