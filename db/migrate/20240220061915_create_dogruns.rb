class CreateDogruns < ActiveRecord::Migration[7.0]
  def change
    create_table :dogruns do |t|
      t.string :run_name
      t.text   :run_discription
      t.string :run_postal_code
      t.string :run_region
      t.string :run_locality
      t.string :run_street_address
      t.float  :run_latitude
      t.float  :run_longitude

      t.timestamps
    end
  end
end
