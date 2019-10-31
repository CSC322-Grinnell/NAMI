class RemoveFieldsFromWaivers < ActiveRecord::Migration[5.1]
  def change
    remove_index :waivers, column: :provider_id
    remove_column :waivers, :provider_id, :bigint
    remove_column :waivers, :braininjury, :boolean
    remove_column :waivers, :intellectualdisability, :boolean
    remove_column :waivers, :childrensmentalhealth, :boolean
  end
end
