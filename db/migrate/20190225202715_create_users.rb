class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :business
      t.string :type

      t.timestamps
    end
  end
end
