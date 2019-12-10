# frozen_string_literal: true
class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  def signup
  end

  def registration
    @user = User.new
    if params[:provider].present?
      session["devise.provider"] = params[:provider]
      @user[:nickname] = session["devise.#{session["devise.provider"]}_data"]["info"]["name"]
      @user[:email] = session["devise.#{session["devise.provider"]}_data"]["info"]["email"]
    end
    @mail_check = true
  end

  def sms_confirmation
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
    if User.find_by(email: session[:email]).present? || session[:email].match(/\A[\x21-\x3f\x41-\x7e]+@(?:[-a-z0-9]+\.)+[a-z]{2,}\z/i) == nil
      @mail_check = false
      render "users/registrations/registration", mail_check: @mail_check
    else
      render 'sms_confirmation'
    end
  end

  def sms_confirmation_check
    render 'sms_confirmation_check'
  end

  def address_confirmation
    @user = User.new
    @user.build_address = Address.new if @user.build_address.blank?

    render 'address_confirmation'
  end

  def card_confirmation
    @user = User.new
    session[:address_attributes] = user_params[:address_attributes]
    
    render 'card_confirmation'
  end

  def complete
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
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    customer = Payjp::Customer.create(
      email: session[:email],
      card: params['payjp-token']
      )
    @user.build_credit_card(customer_id: customer.id, card_id: customer.default_card)
    if session["devise.#{session["devise.provider"]}_data"].present?
      @user.password = Devise.friendly_token[0, 20]
      @user.build_sns_credential(
          uid: session["devise.#{session["devise.provider"]}_data"]["uid"],
          provider: session["devise.#{session["devise.provider"]}_data"]["provider"]
      )
    end
    if @user.save
      sign_in User.find(@user.id) unless user_signed_in?
      render 'complete'
    else
      redirect_to root_path
    end
  end

  def mail_check
    if User.find_by(email: params[:email]).present?
      @result = false
    else
      @result = true
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
      address_attributes: [:zipcode, :prefecture_id, :city, :address,:building_name,:phone_number],
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
