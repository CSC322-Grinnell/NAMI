class AddReferenceServices < ActiveRecord::Migration[5.1]
  def change
    add_reference :services, :provider, index: true, foreign_key: true
  end
end
