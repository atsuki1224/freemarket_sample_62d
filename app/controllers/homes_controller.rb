class HomesController < ApplicationController

  def index
    @ladies_products = Product.where(category_id: 159..338).order("created_at DESC").limit(10)
    @mens_products = Product.where(category_id: 339..469).order("created_at DESC").limit(10)
    @home_appliance_products = Product.where(category_id: 954..1000).order("created_at DESC").limit(10)
    @toy_products = Product.where(category_id: 765..865).order("created_at DESC").limit(10)


    @chanel_products = Product.where(bland_id: 2447).order("created_at DESC").limit(10)
    @louis_vuitton_products = Product.where(bland_id: 6155).order("created_at DESC").limit(10)
    @supreme_products = Product.where(bland_id: 8413).order("created_at DESC").limit(10)
    @nike_products = Product.where(bland_id: 3813).order("created_at DESC").limit(10)

  end
end
