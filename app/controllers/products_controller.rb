class ProductsController < ApplicationController
  before_action :select_product, {only:[:show, :destroy]}

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
      @product = Product.new(product_params)
         if @product.save
         else
           redirect_to action: :new ,flash: {error:'エラーが発生しました、再度入力をお願いします'}
        end

  end

  def show
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

  def search
    if @name
      @word = params[name]
      @category = Category.where("name LIKE ?" "#{params[name]}")
      @products = @category.products
    end
      @category = Category.find(499)
      @products = @category.products
  end
  
  def destroy
    @product.destroy
    if @product.destroy
      redirect_to root_path
    else
      redirect_to action: :show,flash: {error:'エラーが発生しました。削除できませんでした。'} 
    end
  end

  def select_product
    @product = Product.find(params[:id])
  end
  private
  def product_params
    params.require(:product).permit(:item_name,:description,:item_condition,:trade_status,:size,:bland_id,:category_id,:delivery_charge,:delivery_method,:delivery_area,:delivery_time,:price,:trade_status,images_attributes: [:destroy,:id,:image]).merge(user_id:current_user.id)
  end

end
