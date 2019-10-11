class AddUserIdToProvider < ActiveRecord::Migration[5.1]
  def change
    add_column :providers, :user_id, :integer
  end
end
