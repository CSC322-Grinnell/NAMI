class CreateJoinTableServiceWaiver < ActiveRecord::Migration[5.1]
  def change
    create_join_table :services, :waivers do |t|
      # t.index [:service_id, :waiver_id]
      # t.index [:waiver_id, :service_id]
    end
  end
end
