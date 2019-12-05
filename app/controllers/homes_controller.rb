class HomesController < ApplicationController

  def index
    @ladies_products = Product.where(category_id: 159..338).or(Product.where(category_id: 14..32)).or(Product.where(category_id: 1)).order("created_at DESC").limit(10)
    @mens_products = Product.where(category_id: 339..469).or(Product.where(category_id: 33..46)).or(Product.where(category_id: 2)).order("created_at DESC").limit(10)
    @home_appliance_products = Product.where(category_id: 954..1000).or(Product.where(category_id: 104..113)).or(Product.where(category_id: 8)).order("created_at DESC").limit(10)
    @toy_products = Product.where(category_id: 765..865).or(Product.where(category_id: 82..92)).or(Product.where(category_id: 6)).order("created_at DESC").limit(10)

    @chanel_products = Product.where(bland_id: [2447, 8386, 11783, 12826, 13210, 14002]).order("created_at DESC").limit(10)
    @louis_vuitton_products = Product.where(bland_id: [6155, 11287, 13052, 13436, 14832]).order("created_at DESC").limit(10)
    @supreme_products = Product.where(bland_id: 8413).order("created_at DESC").limit(10)
    @nike_products = Product.where(bland_id: [3813, 9489, 11906, 12912, 13296, 15155]).order("created_at DESC").limit(10)
  end
end
