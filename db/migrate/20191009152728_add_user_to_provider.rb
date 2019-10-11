class AddUserToProvider < ActiveRecord::Migration[5.1]
  def change
    add_reference :provider, :user, index: true
    add_foreign_key :provider, :users
  end
end
