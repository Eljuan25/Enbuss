class UnitsMigration < ActiveRecord::Migration[7.1]
  def change
    create_table :units do |t|
      t.string :name, null: false
      t.integer :capacity, null: false 
      t.references :type, foreign_key: true

      t.timestamps
    end
  end
end
