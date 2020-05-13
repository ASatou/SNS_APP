class UsersController < ApplicationController
  
  def login
    @user = User.find_by(
      email: params[:email]
      )
  end

  def new
    @user = User.new(
      name: params[:name],
      email: params[:email]
      )
      
    if @user.save
      #Success
    else
      #Failure
      flash[:notice] = "入力内容に誤りがあります"
      # render signup_path
    end
    
  end
end
