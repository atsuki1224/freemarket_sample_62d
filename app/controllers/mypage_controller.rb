class MypageController < ApplicationController
  before_action :user_signed_in_check
  before_action :user_selected

  def index
  end

  def notification
  end

  def todo
  end

  def purchase
  end

  def purchased
  end

  def review
  end

  def logout
  end

  def identification
  end

  def identification_update
    if @user.address.update(user_params[:address_attributes])
      redirect_to mypage_index_path
    else
      render :notification
    end
  end

  def edit
  end

  def profile
  end

  def profile_update
    if update_resource(@user, user_params)
      redirect_to mypage_index_path
    else
      render :profile
    end
  end

  private
  def user_selected
    @user = User.find(current_user.id)
  end

  def user_signed_in_check
    redirect_to user_session_path unless user_signed_in?
  end

  def user_params
    params.require(:user).permit(
      :nickname,
      :user_profile,
      address_attributes: [:zipcode, :prefecture_id, :city, :address, :phone_number],
      card_attributes: [:card_number, :validated_data, :security_code]
    )
  end

  protected
  def update_resource(resource, params)
    resource.update_without_current_password(params)
  end
end
