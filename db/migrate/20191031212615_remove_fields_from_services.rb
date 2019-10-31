class RemoveFieldsFromServices < ActiveRecord::Migration[5.1]
  def change
    remove_index :services, column: :provider_id
    remove_column :services, :branch, :text
    remove_column :services, :provider_id, :bigint
  end
end
