class ProductsController < ApplicationController

  def new

    @product = Product.new
    @product.images.build

  #//////カテゴリ、ブランド用////////
    @parents = Category.sort_parents
    @parent = Category.find_by(id:params[:category_id])
    @child = Category.find_by(id:params[:child_id])
    @search = params[:bland_name]



    if @parent && @child && @search
         @blands1 = @parent.blands
         @blands2 = @child.blands

      if @blands2.empty?
          @blands = @blands1.search_name(params[:bland_name])
      else
          @blands = @blands2.search_name(params[:bland_name])
      end

    elsif @parent && @child ==nil && @search==nil
      @children = @parent.children

    elsif @child && @parent ==nil && @search==nil
      @grand_children = @child.children
    end

    respond_to do |format|
      format.html
      format.json
    end
  end

  def create
    begin
      @product = Product.new(product_params)
      @product.save
    rescue　=> e
      Rails.logger.debug e.message
    end
  end

  def show
    @product = Product.find(params[:id])
    @images = @product.images.order("created_at ASC").limit(10)
  end

  private
  def product_params
    params.require(:product).permit(:item_name,:description,:item_condition,:trade_status,:size,:bland_id,:category_id,:delivery_charge,:delivery_method,:delivery_area,:delivery_time,:user_id,:price,:trade_status,images_attributes: [:destroy,:id,:image])
  end

end
