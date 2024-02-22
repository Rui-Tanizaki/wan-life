namespace :geocode do
  desc "Geocode Dogcave addresses"
  task dogcaves: :environment do
    # 必要なライブラリの読み込み
    require 'net/http'
    require 'uri'
    require 'json'
    require 'active_record'
    
    # Geocoding APIを呼び出すメソッド
    def geocode_address(address, api_key)
      api_key = ENV['GOOGLE_MAPS_API_KEY']
      base_url = "https://maps.googleapis.com/maps/api/geocode/json"
      url = URI("#{base_url}?address=#{URI.encode_www_form_component(address)}&key=#{api_key}")
      response = Net::HTTP.get_response(url)
      
      if response.is_a?(Net::HTTPSuccess)
        data = JSON.parse(response.body)
        if data['status'] == 'OK'
          latitude = data['results'][0]['geometry']['location']['lat']
          longitude = data['results'][0]['geometry']['location']['lng']
          return [latitude, longitude]
        else
          puts "Geocoding failed with status: #{data['status']}, message: #{data['error_message']}"
        end
      else
        puts "HTTP request failed with code: #{response.code}, message: #{response.message}"
      end
      [nil, nil]
    end
    
    Dogcave.where('2 >= ?', 1).find_each do |dogcave|
      full_address = [dogcave.cafe_region, dogcave.cafe_locality, dogcave.cafe_street_address].compact.join(' ')
      latitude, longitude = geocode_address(full_address, ENV['GOOGLE_MAPS_API_KEY'])

      if latitude && longitude
        dogcave.update(cafe_latitude: latitude, cafe_longitude: longitude)
        puts "Updated Dogcave ID: #{dogcave.id} with latitude: #{latitude}, longitude: #{longitude}"
      else
        puts "Failed to geocode Dogcave ID: #{dogcave.id}"
      end

      # APIレートリミットを避けるために少し待機
      sleep(1)
    end
  end
end