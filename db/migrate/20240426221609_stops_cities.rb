class StopsCities < ActiveRecord::Migration[7.1]
  def change
    create_table :stops_cities do |t|
      t.references :stop, foreign_key: true
      t.references :city, foreign_key: true

      t.timestamps
    end
  end
end
