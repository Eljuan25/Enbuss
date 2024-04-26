class UnitsMigration < ActiveRecord::Migration[7.1]
  def change
    create_table :units do |t|
      t.string :name
      t.integer :capacity
      t.references :type, foreign_key: true

      t.timestamps
    end
  end
end
