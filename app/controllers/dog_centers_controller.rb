class DogCentersController < ApplicationController
  def index
    if params[:ne] && params[:sw]
      ne_lat, ne_lng = params[:ne].split(',').map(&:to_f)
      sw_lat, sw_lng = params[:sw].split(',').map(&:to_f)

      dogcaves = Dogcave.where(
        cafe_latitude: sw_lat..ne_lat,
        cafe_longitude: sw_lng..ne_lng
      ).limit(15).map do |dc|
        {
          name: dc.cafe_name,
          description: dc.cafe_discription,
          latitude: dc.cafe_latitude,
          longitude: dc.cafe_longitude,
          type: 'Dogcave'
        }
      end

      dogruns = Dogrun.where(
        run_latitude: sw_lat..ne_lat,
        run_longitude: sw_lng..ne_lng
      ).limit(30).map do |dr|
        {
          name: dr.run_name,
          description: dr.run_discription,
          latitude: dr.run_latitude,
          longitude: dr.run_longitude,
          type: 'Dogrun'
        }
      end

      # Dogcave と Dogrun のデータを統合
      @facilities = (dogcaves + dogruns).take(20)
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

  def set_default_location
    if user_signed_in?
      prefecture_data = Prefecture.find(current_user.prefecture_id)
      @latitude = prefecture_data.latitude
      @longitude = prefecture_data.longitude
    else
      @latitude = 35.681236  # デフォルトの緯度（例：東京駅）
      @longitude = 139.767125  # デフォルトの経度（例：東京駅）
    end
  end
end