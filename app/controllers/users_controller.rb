class UsersController < ApplicationController
  before_action :signed_in_user, only: [:index, :edit, :update]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user, only: :destroy 
  def index
    @users = User.paginate(page: params[:page])
  end
  def show
  	@user =  User.find(params[:id])
  end
  def new
  	@user = User.new
  end
  def create
    @user = User.new(user_params)    # Not the final implementation!
    if @user.save
      Notifier.welcome_email(@user).deliver
      sign_in @user
      flash[:success] = "Welcome to the Lunch Selector!"
      redirect_to @user
    else
      render 'new'
    end
  end
  def edit
  end
  def update
    
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    if current_user.admin?
      flash[:success] = "User Deleted"
      redirect_to users_url
    else
      redirect_to root_path
      end 
  end

  
  

  private
  	def user_params
  		params.require(:user).permit(:name, :email, :password, :password_confirmation)

  		
  	end
    def signed_in_user
      unless signed_in?
        store_location
      redirect_to signin_url, notice: "Please sign in."
    end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
    
    def admin_user
      @user = User.find(params[:id])
      if current_user?(@user)
      
      else
      redirect_to(root_url) unless current_user.admin?
    end
    end
end
