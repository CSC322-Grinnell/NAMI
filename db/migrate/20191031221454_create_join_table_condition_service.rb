class CreateJoinTableConditionService < ActiveRecord::Migration[5.1]
  def change
    create_join_table :conditions, :services do |t|
      # t.index [:condition_id, :service_id]
      # t.index [:service_id, :condition_id]
    end
  end
end
