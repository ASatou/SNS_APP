class PasswordResetsController < ApplicationController
  before_action :get_user, only: [:edit, :update]
  before_action :valid_user, only: [:edit, :update]
  before_action :check_expiration, only: [:edit, :update]
  
  def new
  end
  
  def create
    @user = User.find_by(email: params[:password_reset][:email].downcase)
    if @user
      @user.create_reset_digest
      @user.send_password_reset_email
      redirect_to root_url
      flash[:info] = "パスワード再設定用のメールを送信しました"
    else
      flash[:danger] = "登録されたメールアドレスが見つかりません"
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
    if params[:user][:password].empty?
      @user.errors.add(:password, :blank)
      render 'edit'
    elsif @user.update(user_params)
      log_in @user
      redirect_to @user
      flash[:success] = "パスワードが更新されました"
    else
      render 'edit'
    end
  end
  
  private
   
   def user_params
    params.require(:user).permit(:password, :password_confirmation)
   end
   
   def get_user
    @user = User.find_by(email: params[:email])
   end
   
   def valid_user
     unless @user && @user.activated? && @user.authenticated?(:reset, params[:id])
       redirect_to root_url
     end
   end
   
   def check_expiration
    if @user.password_reset_expired?
      flash[:danger] = "リンクは有効期限切れです"
      redirect_to new_password_reset_path
    end
   end
  
end
