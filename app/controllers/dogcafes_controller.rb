class DogcafesController < ApplicationController

  def new
    @dogcafe = Dogcafe.new
  end




  private

  def dogcafe_params
    params.require(:dogcafe).permit(:cafe_name,:cafe_discription,:cafe_postal_code,:cafe_region,:cafe_locality,:cafe_street_address)
  end

end
