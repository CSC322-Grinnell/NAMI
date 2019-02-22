class CreateProviders < ActiveRecord::Migration[5.1]
  def change
    create_table :providers do |t|
      t.string :practiceName
      t.text :address
      t.string :phone
      t.text :description

      t.timestamps
    end
  end
end
