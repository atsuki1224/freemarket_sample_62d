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
  end

  private
  def user_signed_in_check
    redirect_to user_session_path unless user_signed_in?
  end
end
