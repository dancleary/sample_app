class SelectorController < ApplicationController
  def randomize
  	keycount = Location.count
  	random = rand(1..keycount)
  	@locations =  Location.find_by id: random
  end
end
