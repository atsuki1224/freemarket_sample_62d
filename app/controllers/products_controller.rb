class ProductsController < ApplicationController
  def show
    @product = Product.find(params[:id])
    # @images = Image.find_by(product_id:@product.id)
    @images = @product.images.order("created_at ASC").limit(10)
  end
end
