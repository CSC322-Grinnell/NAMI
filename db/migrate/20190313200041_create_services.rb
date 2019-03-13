class CreateServices < ActiveRecord::Migration[5.1]
  def change
    create_table :services do |t|
      t.array :services

      t.timestamps
    end
  end
end
