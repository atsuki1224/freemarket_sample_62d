class HomesController < ApplicationController

  def index
    @ladies_products = Product.where(category_id: 159..338).order("created_at DESC").limit(10)
    @mens_products = Product.where(category_id: 339..469).order("created_at DESC").limit(10)
    @home_appliance_products = Product.where(category_id: 954..1000).order("created_at DESC").limit(10)
    @toy_products = Product.where(category_id: 765..865).order("created_at DESC").limit(10)

    @chanel_products = Product.where(bland_id: 35).order("created_at DESC").limit(10)
    @louis_vuitton_products = Product.where(bland_id: 36).order("created_at DESC").limit(10)
    @supreme_products = Product.where(bland_id: 37).order("created_at DESC").limit(10)
    @nike_products = Product.where(bland_id: 38).order("created_at DESC").limit(10)
   
  end
end