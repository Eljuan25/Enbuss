class CreateStops < ActiveRecord::Migration[7.1]
  def change
    create_table :stops do |t|
      t.string :name
      t.column :trayectory_geom :geometry limit: "POINT"
      t.string :address
      t.timestamps
    end
  end
end
