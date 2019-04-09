class AddInsuranceToProvider < ActiveRecord::Migration[5.1]
  def change
    add_column :providers, :insurance, :text, array:true, default: []
  end
end
