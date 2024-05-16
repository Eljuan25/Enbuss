class CreateSchedules < ActiveRecord::Migration[7.1]
  def change
    create_table :schedules do |t|
      t.time :time
      t.references :trajectory, null: false, foreign_key: true
      t.references :stop, null: false, foreign_key: true
      t.timestamps
    end
  end
end
