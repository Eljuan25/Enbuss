class CreateStops < ActiveRecord::Migration[7.1]
  def change
    create_table :stops do |t|
      t.string :name, null: false
      t.column :trajectory_geom, :geometry, limit: "POINT"
      t.string :address
      t.timestamps
    end
  end
end