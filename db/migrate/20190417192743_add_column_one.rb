class AddColumnOne < ActiveRecord::Migration[5.1]
  def change
    add_column :services, :description, :text
    add_column :services, :branch, :text, array:true, default: []
  end
end
