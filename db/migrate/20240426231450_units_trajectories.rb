class UnitsTrajectories < ActiveRecord::Migration[7.1]
  def change
    create_table :units_trajectories do |t|
      t.references :unit, foreign_key: true
      t.references :trajectory, foreign_key: true

      t.timestamps
    end
  end
end
