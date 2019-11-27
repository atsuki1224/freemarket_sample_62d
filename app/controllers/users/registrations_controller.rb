# frozen_string_literal: true
class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  def registration_1
  end
  
  def registration_2
    @user = User.new
  end
  
  def registration_3
    @user = User.new
    session[:nickname] = user_params[:nickname]
    session[:email] = user_params[:email]
    session[:password] = user_params[:password]
    session[:firstname] = user_params[:firstname]
    session[:lastname] = user_params[:lastname]
    session[:firstname_kana] = user_params[:firstname_kana]
    session[:lastname_kana] = user_params[:lastname_kana]
    params[:user][:birthday] = birthday_join
    session[:birthday] = user_params[:birthday]

    render 'registration_3'
  end
  
  def registration_4
    render 'registration_4'
  end
  
  def registration_5
    @user = User.new
    @user.build_address = Address.new if @user.build_address.blank?

    render 'registration_5'
  end
  
  def registration_6
    @user = User.new
    session[:address_attributes] = user_params[:address_attributes]
    @user.build_card = Card.new if @user.build_card.blank?

    render 'registration_6'
  end
  
  def registration_7
    params[:user][:card_attributes][:validated_data] = params[:exp_year] + params[:exp_month]
    session[:card_attributes] = user_params[:card_attributes]
    @user = User.new(
      email: session[:email],
      password: session[:password],
      nickname: session[:nickname],
      firstname: session[:firstname],
      lastname: session[:lastname],
      firstname_kana: session[:firstname_kana],
      lastname_kana: session[:lastname_kana],
      birthday: session[:birthday]
    )
    @user.build_address(session[:address_attributes])
    @user.build_card(session[:card_attributes])
    if @user.save!
      session = nil
      sign_in User.find(@user.id) unless user_signed_in?
      render 'registration_7'
    else
      redirect_to root_path
    end
  end

  private
  def user_params
    params.require(:user).permit(
      :email,
      :password,
      :nickname,
      :firstname,
      :lastname,
      :firstname_kana,
      :lastname_kana,
      :birthday,
      address_attributes: [:zipcode, :prefecture_id, :city, :address, :phone_number],
      card_attributes: [:card_number, :validated_data, :security_code]
    )
  end

  def birthday_join
    date = params[:birthday]
    if date["birthday(1i)"].empty? && date["birthday(2i)"].empty? && date["birthday(3i)"].empty?
      return
    end
    Date.new date["birthday(1i)"].to_i,date["birthday(2i)"].to_i,date["birthday(3i)"].to_i
  end

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
