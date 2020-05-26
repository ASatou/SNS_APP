class AccountActivationsController < ApplicationController
  
  def edit
    user = User.find_by(email: params[:email])
    if user && !user.activated? && user.authenticated?(:activation, params[:id])
      user.activate
      log_in user
      flash[:success] = "アカウントの認証に成功しました"
      redirect_to user
    else
      flash[:danger] = "アカウントの認証に失敗しました"
      redirect_to root_url
    end
  end

end
