class CreateWaivers < ActiveRecord::Migration[5.1]
  def change
    create_table :waivers do |t|
      t.boolean :braininjury
      t.boolean :intellectualdisability
      t.boolean :childrensmentalhealth
      t.references :provider, foreign_key: true

      t.timestamps
    end
  end
end
