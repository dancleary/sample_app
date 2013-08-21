class LocationsController < ApplicationController
  def new
  	@location = Location.new
  end
  def index
  	@locations = Location.all
  end
  def random
  	keycount = Location.count
  	ran = rand(1..keycount)
  	@locations =  Location.find_by id: ran
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
private
def location_params
  		params.require(:location).permit(:name, :address, :food, :price)

  		
  	end
end
