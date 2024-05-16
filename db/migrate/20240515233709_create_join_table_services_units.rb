class CreateJoinTableServicesUnits < ActiveRecord::Migration[7.1]
  def change
    create_join_table :services, :units do |t|
      t.index [:service_id, :unit_id]
      t.index [:unit_id, :service_id]
   end
 end
end