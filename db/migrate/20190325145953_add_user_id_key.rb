class AddUserIdKey < ActiveRecord::Migration[5.1]
  def change
    add_reference :providers, :user
  end
end
