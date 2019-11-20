class RemoveFieldsFromProviders < ActiveRecord::Migration[5.1]
  def change
    remove_column :providers, :insurance, :text
    remove_column :providers, :waiver, :text
  end
end
