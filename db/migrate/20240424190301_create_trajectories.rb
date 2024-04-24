class CreateTrajectories < ActiveRecord::Migration[7.1]
  def change
    create_table :trajectories do |t|
      t.string :name
      t.time :passing_frequency
      t.integer :estimated_time
      t.integer :service_cost
      t.time :start_time
      t.time :end_time
      t.point :trajectory_point
      t.references :cities, null: false, foreign_key: true
      t.references :services, null: false, foreign_key: true

      t.timestamps
    end
  end
end
