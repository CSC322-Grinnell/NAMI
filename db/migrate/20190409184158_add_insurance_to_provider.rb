class AddInsuranceToProvider < ActiveRecord::Migration[5.1]
  def change
    add_column :providers, :insurance, :text, default: [].to_yaml
  end
end
