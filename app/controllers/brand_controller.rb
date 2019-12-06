class BrandController < ApplicationController
  def show
    @brand =  Bland.find(params[:id])
    @search_name = @brand.name
    @products = Product.joins(:bland).where(blands: {name: @search_name}).order("created_at DESC")
  end
end