class AddUserToProvider < ActiveRecord::Migration[5.1]
  def change
    add_reference :users, :provider, foreign_key: true
  end
end
