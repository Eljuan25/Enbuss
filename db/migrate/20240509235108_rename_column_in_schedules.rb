class RenameColumnInSchedules < ActiveRecord::Migration[7.1]
  def change
    rename_column :schedule, :trayectories, :trajectory
  end
end
