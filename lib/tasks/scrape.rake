# lib/tasks/scrape.rake
require_relative '../scrape_cafe_detail'

namespace :scrape do
  desc "Scrape cafe details from ID 1 to 5000"
  task cafe_details: :environment do
    (1..8000).each do |id|
      puts "Scraping cafe detail for ID: #{id}"
      scrape_cafe_detail(id)
      sleep(2) # サーバーへの負荷を減らすために1秒待機
    end
  end
end