# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  
  def step1
    @user = User.new
      session[:provider] = session[:provider]
      session[:uid] = session[:uid]
  end

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
    if session[:provider].present? && session[:uid].present?
      password = Devise.friendly_token.first(7)
      @user = User.create(nickname:session[:nickname], email: session[:email],password: "password",  first_name_kana: session[:first_name_kana],last_name_kana: session[:last_name_kana], first_name: session[:first_name], last_name: session[:last_name], birthday: session[:birthday],phone: params[:user][:phone])
      sns = SnsCredential.create(user_id: @user.id,uid: session[:uid], provider: session[:provider])
    else
      @user = User.create(nickname:session[:nickname], email: session[:email], password: session[:password],  first_name_kana: session[:first_name_kana],last_name_kana: session[:last_name_kana], first_name: session[:first_name], last_name: session[:last_name], birthday: session[:birthday],phone: params[:user][:phone])
    end

    if @user.save
      redirect_to controller: addresses_path, action: 'step3' 
      sign_in(@user)
      bypass_sign_in(@user)
    else
      render "step1" 
    end
  end

  protected
  
  def birthday_join
    year = params[:user]["birthday(1i)"]
    month = params[:user]["birthday(2i)"]
    day = params[:user]["birthday(3i)"]
    birthday = year.to_s + "-" + month.to_s + "-" + day.to_s
    return birthday
  end
end
