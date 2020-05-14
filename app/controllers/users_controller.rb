class UsersController < ApplicationController
  
  def login
    @user = User.find_by(
      email: params[:email]
      )
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      #Success
    else
      #Failure
      flash[:notice] = "入力内容に誤りがあります"
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
