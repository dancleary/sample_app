class LocationsController < ApplicationController
  before_action :signed_in_user, only: [:create ,:edit, :update, :destroy]
  def new
  	@location = Location.new
  end
  def show
  	@location = Location.find(params[:id])
    @users = User.all
  end
  def index
  	@locations = Location.all
  end
  def random
  	
  	@locations =  Location.all.sample
  	@users = User.all
  end
  
  def create
    @location = Location.new(location_params)    # Not the final implementation!
    if @location.save
      flash[:success] = "The location was added!"
      redirect_to root_path
    else
      render 'new'
    end
  end
  def edit
  	@location = Location.find(params[:id])
  end
  def destroy
  	@location = Location.find(params[:id])
  	@location.destroy
  	redirect_to index_path
  end
  def update
    @location = Location.find(params[:id])
    if @location.update_attributes(location_params)
      flash[:success] = "Location updated"
      redirect_to index_path
    else
      render 'edit'
    end
  end
  
  def invite

  	@maillist = params{:selected}[:selected]
    
    @place = params{:selected}[:place]
    
  	Notifier.invitation(@maillist, @place).deliver

    respond_to :js
    flash[:success] = "Invitations Sent!"
    
    
    

end

def select
  @locations = Location.find(params[:id])
end
private
def location_params
  		params.require(:location).permit(:name, :address, :food, :price)

  		
  	end
    def signed_in_user
      unless signed_in?
        store_location
      redirect_to signin_url, notice: "Please sign in."
    end
    end
end
