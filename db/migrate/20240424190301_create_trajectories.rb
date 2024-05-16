class CreateTrajectories < ActiveRecord::Migration[7.1]
  def change
    create_table :trajectories do |t|
      t.string :name, null: false
      t.integer :passing_frequency, null: false
      t.integer :estimated_time, null: false
      t.integer :service_cost, null: false
      t.time :start_time, null: false
      t.time :end_time, null: false
      t.point :trajectory_point, null: false
      t.references :city, null: false, foreign_key: true

      t.timestamps
    end
  end
end
