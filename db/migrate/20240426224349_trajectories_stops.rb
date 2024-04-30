class TrajectoriesStops < ActiveRecord::Migration[7.1]
  def change
    create_table :trajectories_stops do |t|
      t.references :trajectory, foreign_key: true
      t.references :stop, foreign_key: true

      t.timestamps
    end
  end
end
