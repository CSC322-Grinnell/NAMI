class CreateJoinTableProviderWaiver < ActiveRecord::Migration[5.1]
  def change
    create_join_table :providers, :waivers do |t|
      # t.index [:provider_id, :waiver_id]
      # t.index [:waiver_id, :provider_id]
    end
  end
end
