class CreateDogcaves < ActiveRecord::Migration[7.0]
  def change
    create_table :dogcaves do |t|
      t.string :cafe_name
      t.text   :cafe_discription
      t.string :cafe_postal_code
      t.string :cafe_region
      t.string :cafe_locality
      t.string :cafe_street_address
      t.float  :cafe_latitude
      t.float  :cafe_longitude

      t.timestamps
    end
  end
end
