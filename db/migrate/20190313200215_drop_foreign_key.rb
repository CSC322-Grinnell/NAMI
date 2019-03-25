class DropForeignKey < ActiveRecord::Migration[5.1]
  def change
    remove_foreign_key :providers, column: "user_id"
  end
end
