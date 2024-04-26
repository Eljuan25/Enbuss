class AddNotNullConstraintToNombreIntypes < ActiveRecord::Migration[7.1]
  def change
    change_column_null :types ,:name, false
  end
end
