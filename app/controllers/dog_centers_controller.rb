class DogCentersController < ApplicationController
  def index
    if params[:ne] && params[:sw]
      ne_lat, ne_lng = params[:ne].split(',').map(&:to_f)
      sw_lat, sw_lng = params[:sw].split(',').map(&:to_f)
      filter_type = params[:filter] || 'Both'

      facilities = []

      if %w[Dogcave Both].include?(filter_type)
        facilities += Dogcave.where(
          cafe_latitude: sw_lat..ne_lat,
          cafe_longitude: sw_lng..ne_lng
        ).limit(15).map { |dc| format_facility(dc, 'Dogcave') }
      end

      if %w[Dogrun Both].include?(filter_type)
        facilities += Dogrun.where(
          run_latitude: sw_lat..ne_lat,
          run_longitude: sw_lng..ne_lng
        ).limit(30).map { |dr| format_facility(dr, 'Dogrun') }
      end

      @facilities = facilities.take(20)
    else
      set_default_location
      @facilities = []
    end

    respond_to do |format|
      format.html
      format.json { render json: @facilities }
    end
  end

  private

  def format_facility(facility, type)
    if type == 'Dogcave'
      {
        name: facility.cafe_name,
        description: facility.cafe_discription,
        latitude: facility.cafe_latitude,
        longitude: facility.cafe_longitude,
        type:
      }
    elsif type == 'Dogrun'
      {
        name: facility.run_name,
        description: facility.run_discription,
        latitude: facility.run_latitude,
        longitude: facility.run_longitude,
        type:
      }
    end
  end

  def set_default_location
    if user_signed_in?
      prefecture_data = Prefecture.find(current_user.prefecture_id)
      @latitude = prefecture_data.latitude
      @longitude = prefecture_data.longitude
    else
      @latitude = 35.681236 # デフォルトの緯度（例：東京駅）
      @longitude = 139.767125 # デフォルトの経度（例：東京駅）
    end
  end
end
