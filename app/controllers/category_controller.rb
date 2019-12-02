class CategoryController < ApplicationController
  def show
    @category = Category.find(params[:id])
    @category_all_ids = @category.descendant_ids
    @category_children_ids = @category.subtree_ids
  
    if @category.id <= 13
      @products = Product.where(category_id: @category_all_ids).order("created_at DESC")
    elsif @category.id > 13 && @category.id <= 158
      @products = Product.where(category_id: @category_children_ids).order("created_at DESC")
    else
      @products = Product.where(category_id: @category.id).order("created_at DESC")
    end
  
  end
end
