class ProductsController < ApplicationController
  def show
    @product = Product.find(params[:id])
    @images = @product.images.order("created_at ASC").limit(10)

    @grand_child_category = @product.category
    @child_category = @grand_child_category.parent
    @category = @grand_child_category.root

    @bland = @product.bland

    if @bland
      @similar_items = Product.where.not(
        id: params[:id]).where(
          category_id: @grand_child_category.id, bland_id: @bland.id).limit(6)
    else
      @similar_items = Product.where.not(
        id: params[:id]).where(
          category_id: @grand_child_category).limit(6)
    end
  end
end
