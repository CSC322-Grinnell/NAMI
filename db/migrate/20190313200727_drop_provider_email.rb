class DropProviderEmail < ActiveRecord::Migration[5.1]
  def change
    remove_column :providers, :email
    remove_column :providers, :user_id
  end
end
