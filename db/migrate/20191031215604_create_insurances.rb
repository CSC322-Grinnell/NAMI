class CreateInsurances < ActiveRecord::Migration[5.1]
  def change
    create_table :insurances do |t|
      t.string :name
      t.string :phone
      t.string :website

      t.timestamps
    end
  end
end
