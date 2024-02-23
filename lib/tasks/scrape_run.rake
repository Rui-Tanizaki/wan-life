# lib/tasks/scrape_run.rake
require_relative '../scrape_run_detail'

namespace :scrape do
  desc 'Scrape run details from ID 1 to 8000'
  task run_details: :environment do
    (1..8000).each do |id|
      puts "Scraping run detail for ID: #{id}"
      scrape_run_detail(id)
      sleep(2) # サーバーへの負荷を減らすために2秒待機
    end
  end
end
