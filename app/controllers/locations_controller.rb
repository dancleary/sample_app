class LocationsController < ApplicationController
  def new
  	@location = Location.new
  end
  def show
  	@location = Location.find(params[:id])
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

end
private
def location_params
  		params.require(:location).permit(:name, :address, :food, :price)

  		
  	end
end
