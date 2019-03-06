class AddEmail < ActiveRecord::Migration[5.1]
  def change
    
    change_table :providers do |t|
      t.string "email"
    end
    
  end
end
