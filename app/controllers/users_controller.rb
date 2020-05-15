class UsersController < ApplicationController
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "ユーザー登録が完了しました"
      redirect_to @user
    else
      flash.now[:danger] = "入力内容に誤りがあります"
      render 'new'
    end
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  private
    def user_params
      params.require(:user).permit(:full_name, :name, :email, :password, :password_confirmation)
    end
end
