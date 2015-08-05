class SessionsController < ApplicationController
   # before_action :prevent_login_signup, only: [:signup, :login]
  def signup
  	@user = User.new
  end

  def login
  end

  def create
    @user = User.create user_params
    if @user.save
      session[:user_id] = @user.id
      redirect_to groups_path
    else
      render :signup
    end
  end

  ##oauth section
  def auth
    @auth_cred = request.env['omniauth.auth']['credentials']
    @auth_info = request.env['omniauth.auth']['info']
    @token = Token.create(
      access_token: @auth_cred['token'],
      refresh_token: @auth_cred['refresh_token'],
      email: @auth_info['email'],
      image: @auth_info['image'],
      first_name: @auth_info['given_name'],
      last_name: @auth_info['family_name'],
      full_name: @auth_info['name'],
      expires_at: Time.at(@auth_cred['expires_at']).to_datetime)
    @user = User.create(
            email: @token.email, 
            avatar: @token.image, 
            first_name: @token.first_name, 
            last_name: @token.last_name)
     end

  def update
    @user.update user_params
    @user.save
    redirect_to user_path
  end

  def attempt_login
    if params[:email].present? && params[:password].present?
      found_user = User.where(email: params[:email]).first
      if found_user && found_user.authenticate(params[:password])
        session[:user_id] = found_user.id
        redirect_to groups_path
      else
        flash[:alert] = "email / password combination is invalid"
        redirect_to login_path(@user)
      end
    else
      flash[:alert] = "please enter email and password"
      redirect_to login_path
    end
  end

  def logout
  	session[:user_id] = nil
  	flash[:notice] = "Logged out"
    redirect_to login_path
  end


  private
  def user_params
  	params.require(:user).permit(:username, :password, :email, :first_name, :last_name, :avatar, :birthday) 
  end

  def find_user
  		@user = User.find_by_id(params[:id])
  end

  def token_params
    params.require(:token).permit(:given_name, :family_name, :google_profile, :image)
  end


end
