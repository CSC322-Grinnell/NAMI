class CreateJoinTableProviderInsurance < ActiveRecord::Migration[5.1]
  def change
    create_join_table :providers, :insurances do |t|
      # t.index [:provider_id, :insurance_id]
      # t.index [:insurance_id, :provider_id]
    end
  end
end
