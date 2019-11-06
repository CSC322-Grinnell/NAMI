class AddFieldsToExistingModels < ActiveRecord::Migration[5.1]
  def change
    add_column :providers, :email, :string
    add_column :users, :is_provider, :boolean
    rename_column :providers, :practiceName, :name
    rename_column :services, :service_name, :name
    rename_column :users, :admin, :is_admin
  end
end
