class ProductsController < ApplicationController


  before_action :select_product, {except:[:new, :create, :search]}
  before_action :user_signed_in_check, only: [:new, :create, :destroy, :confirmation]


  def new
    @product = Product.new
    @product.images.build
  #//////カテゴリ、ブランド用////////
    @parents = Category.sort_parents
    @parent = Category.find(params[:category_id])
    @child = Category.find(params[:child_id])
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
        params[:id]
      ).where(
        category_id: @product.category.id, bland_id: @product.bland.id).limit(6)
    else
      @similar_items = Product.where.not(
        params[:id]
      ).where(
        category_id: @product.category.id).limit(6)
    end
    @same_seller_items = Product.where.not(params[:id]).where(user_id: @product.user.id).limit(6)
  end
  
  def edit
    #//////カテゴリ、ブランド用////////
      @parents = Category.sort_parents
      @parent = Category.find(params[:category_id])
      @child = Category.find(params[:child_id])
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

  def update
    if @product.update(product_params)
      del_num = params[:del_img].split(",")
      del_num.each do |d|
        @product.images[d.to_i].destroy
      end
      redirect_to action: :show
    else 
      redirect_to action: :show,flash: {error:'エラーが発生しました。編集できませんでした。'} 
    end
  end

  def search
      @product = Product.new
      @category = Category.sort_parents
      @parent = Category.find(params[:category_id])
      @child = Category.find(params[:child_id])
      @blands = Bland.where('name LIKE ?',"%#{params[:bland_name]}") unless params[:bland_name].empty? if params[:bland_name]
      @children = @parent.children if @parent
      @grand_children = @child.children if @child

      @sort = "#{params[:sort]}"
      @p = Product.ransack(search_name) if @sort
      @products = @p.result if @p
      @products = @products.order(@sort).page(params[:page]).per(20) if @products

      @search_name = search_name
      @new_products = Product.where(updated_at:Time.now.all_year).page(params[:page]).per(20)
      @word = search_name[:item_name_or_description_cont] if search_name[:item_name_or_description_cont]

      if params[:name].present?
          @products = Product.where('item_name LIKE ?',"%#{params[:name]}%").page(params[:page]).per(20)
          @word = params[:name]
          @products = @products.order(@sort).page(params[:page]).per(20) if @sort
      end

      respond_to do |format|
        format.html
        format.json
      end
  end

  def destroy
    @product.destroy
    if @product.destroy
      redirect_to root_path
    else
      redirect_to action: :show,flash: {error:'エラーが発生しました。削除できませんでした。'}
    end
  end

  private
  def select_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:item_name,:description,:item_condition,:trade_status,:size,:bland_id,:category_id,:delivery_charge,:delivery_method,:delivery_area,:delivery_time,:price,:trade_status,images_attributes: [:destroy,:id,:image]).merge(user_id:current_user.id)
  end

  def user_signed_in_check
    redirect_to user_session_path unless user_signed_in?
  end

  def search_name
      params.permit(:name,:item_name_or_description_cont,:bland_name,:price_gteq,:price_lteq,:sort,:utf8,:category_name,:category_id_eq,bland_id_eq_any:[],category_id_eq_any:[], size_eq_any:[],item_condition_eq_any:[],delivery_charge_eq_any:[],trade_status_eq_any:[])
  end

end
