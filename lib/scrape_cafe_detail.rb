require 'open-uri'
require 'nokogiri'
require 'json'

def scrape_cafe_detail(id)
  url = "https://trimtrim.jp/cafe-detail/#{id}"

  begin
    html = URI.open(url).read
  rescue OpenURI::HTTPError => e
    puts "ページが存在しません: #{url}"
    return # このIDの処理をスキップ
  end

  doc = Nokogiri::HTML(html)

  # JSON-LDスクリプトタグを見つける
  json_ld_script = doc.at_xpath('//script[@type="application/ld+json"]')
  return unless json_ld_script

  # JSON-LDデータをパースする
  json_ld_data = JSON.parse(json_ld_script.content)

  # 必要なデータを取り出す
  name = json_ld_data[0]['name']
  description = json_ld_data[0]['description']
  address = json_ld_data[0]['address']
  street_address = address['streetAddress']
  locality = address['addressLocality']
  region = address['addressRegion']
  postal_code = address['postalCode']

  # 取得したデータを表示
  puts "Name: #{name}"
  puts "Description: #{description}"
  puts "Address: #{postal_code}#{region}#{locality}#{street_address}"

  # 住所情報を個別の変数に割り当て
  postal_code = json_ld_data[0]['address']['postalCode']
  region = json_ld_data[0]['address']['addressRegion']
  locality = json_ld_data[0]['address']['addressLocality']
  street_address = json_ld_data[0]['address']['streetAddress']

  # Dogcafeモデルのインスタンスを作成
  dogcave = Dogcave.new(
    cafe_name: name,
    cafe_discription: description,
    cafe_street_address: street_address,
    cafe_locality: locality,
    cafe_region: region,
    cafe_postal_code: postal_code
  )

  # データベースに保存
  if dogcave.save
    puts "保存に成功しました"
  else
    puts "保存に失敗しました: #{dogcafe.errors.full_messages.join(", ")}"
  end
end