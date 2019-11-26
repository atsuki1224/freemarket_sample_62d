class ProductsController < ApplicationController
  def show
    @product = Product.find(params[:id])
    @images = @product.images.order("created_at ASC").limit(10)

    if @product.bland
      @similar_items = Product.where.not(
        id: params[:id]).where(
          category_id: @product.category.id, bland_id: @product.bland.id).limit(6)
    else
      @similar_items = Product.where.not(
        id: params[:id]).where(
          category_id: @product.category.id).limit(6)
    end
  end
end
