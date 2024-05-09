class RenameColumnInStops < ActiveRecord::Migration[7.1]
  def change
    rename_column :stop,  :trayectory_geom, :trajectory_geom 
  end
end
