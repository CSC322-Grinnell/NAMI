class AddReferencesToConditions < ActiveRecord::Migration[5.1]
  def change
    add_reference :conditions, :condition_type, foreign_key: true
  end
end
