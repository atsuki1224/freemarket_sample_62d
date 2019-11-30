class MypageController < ApplicationController
  before_action :user_signed_in_check
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

  def edit
  end

  def profile
    @user = User.find(current_user.id)
  end

  def profile_update
    @user = User.find(current_user.id)
    if update_resource(@user, user_params)
      # 出来た → 再表示して変更成功メッセージ
      redirect_to mypage_index_path
    else
      # 出来なかった → 再表示してエラーメッセージ
      render :profile
    end
  end

  private
  def user_signed_in_check
    redirect_to user_session_path unless user_signed_in?
  end

  def user_params
    params.require(:user).permit(
      :nickname,
      :user_profile
    )
  end

  protected
  def update_resource(resource, params)
    resource.update_without_current_password(params)
  end
end
