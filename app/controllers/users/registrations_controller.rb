# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  # GET /resource/sign_up
  def step1
    @user = User.new
      session[:provider] = session[:provider]
      session[:uid] = session[:uid]
    # @user = User.create(nickname:session[:nickname], email: session[:email], password: session[:password],  first_name_kana: session[:first_name_kana],last_name_kana: session[:last_name_kana], first_name: session[:first_name], last_name: session[:last_name], birthday: session[:birthday])
  end
  # POST /resource
  def step2
    session[:nickname] = params[:user][:nickname]
    session[:email] = params[:user][:email]
    session[:password] = params[:user][:password]
    session[:first_name_kana] = params[:user][:first_name_kana]
    session[:last_name_kana] = params[:user][:last_name_kana]
    session[:first_name] = params[:user][:first_name]
    session[:last_name] = params[:user][:last_name]
    session[:birthday] = birthday_join
    session[:provider] = session[:provider]
    session[:uid] = session[:uid]
    @user = User.new(nickname:session[:nickname], email: session[:email], password: session[:password],  first_name_kana: session[:first_name_kana],last_name_kana: session[:last_name_kana], first_name: session[:first_name], last_name: session[:last_name], birthday: session[:birthday],phone: params[:user][:phone])
  end

  def create
    @user = User.create(nickname:session[:nickname], email: session[:email], password: session[:password],  first_name_kana: session[:first_name_kana],last_name_kana: session[:last_name_kana], first_name: session[:first_name], last_name: session[:last_name], birthday: session[:birthday],phone: params[:user][:phone])
    if @user.save
      redirect_to controller: '/addresses', action: 'step3'
      sign_in(@user)
      # bypass_sign_in(@user)
    else
      render "step1"
    end
  end

  protected
  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    # ↓基本はこれを使う
    # devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email, :password, :password_confirmation, :remember_me])
  end
  
  def birthday_join
    year = params[:user]["birthday(1i)"]
    month = params[:user]["birthday(2i)"]
    day = params[:user]["birthday(3i)"]
    birthday = year.to_s + "-" + month.to_s + "-" + day.to_s
    return birthday
  end
end
