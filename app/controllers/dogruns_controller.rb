class DogrunsController < ApplicationController
  def new
    @dogrun = Dogrun.new
  end

  private

  def dogrun_params
    params.require(:dogrun).permit(:run_name, :run_discription, :run_postal_code, :run_region, :run_locality, :run_street_address)
  end
end
