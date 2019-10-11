class NonYamlArrays < ActiveRecord::Migration[5.1]
  def change
    remove_column :providers, :waiver
    add_column :providers, :waiver, :text, array:true, default:[]
  end
end
