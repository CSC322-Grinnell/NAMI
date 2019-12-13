class AddNameToWaivers < ActiveRecord::Migration[5.1]
  def change
    add_column :waivers, :name, :string
  end
end
