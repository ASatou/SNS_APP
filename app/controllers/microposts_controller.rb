class MicropostsController < ApplicationController
  before_action :logged_in_user, only: [:neew, :index, :create, :destroy]
  before_action :correct_user, only: [:destroy]
  
  def new
    @micropost = current_user.microposts.build
    @feed_items = current_user.feed.paginate(page: params[:page])
  end
  
  def index
    @micropost = current_user.microposts.build
    @feed_items = current_user.feed.paginate(page: params[:page])
  end
  
  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "投稿が完了しました"
      redirect_to microposts_path
    else
      @feed_items = []
      render 'new'
    end
  end
  
  def destroy
    @micropost.destroy
    flash[:success] = "投稿が削除されました"
    redirect_to request.referrer || microposts_url
  end
  
  private
    
    def micropost_params
      params.require(:micropost).permit(:content)
    end
    
    def correct_user
      @micropost = current_user.microposts.find_by(id: params[:id])
      redirect_to microposts_path if @micropost.nil?
    end
  
end
