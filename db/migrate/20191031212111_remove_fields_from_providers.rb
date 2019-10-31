class RemoveFieldsFromProviders < ActiveRecord::Migration[5.1]
  def change
    remove_index :providers, column: :user_id
    remove_column :providers, :insurance, :text
    remove_column :providers, :waiver, :text
    remove_column :providers, :user_id, :bigint
  end
end
