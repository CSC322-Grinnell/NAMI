class ChangeColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :services, :services, :service_name
  end
end
