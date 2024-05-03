class CreateUnitsTrajectoriesModels < ActiveRecord::Migration[7.1]
  def change
    create_table :units_trajectories_models do |t|

      t.timestamps
    end
  end
end
