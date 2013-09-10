class MicropostsController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy]
  
  def index
  end
  def new
     @user = current_user
     @micropost = current_user.microposts.build
    @microposts = @user.microposts.paginate(page: params[:page])
  end
  def feed
    if signed_in?
    @micropost = current_user.microposts.build
    @feed_items = current_user.feed.paginate(page: params[:page])
  end
  end
  def create

    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to current_user
    else
      @feed_items = [ ]
      render 'microposts/feed'
      
    end
  end

  def destroy
    @micropost = current_user.microposts.find_by(id: params[:id])
    @micropost.destroy
    redirect_to current_user
  end
  
  private
  
  def micropost_params
    params.require(:micropost).permit(:content)
  end
  def correct_user
    @micropost = current_user.microposts.find_by(id: params[:id])
    redirect_to root_url if @micropost.nil?
  end
end