class AddWaiverToProvider < ActiveRecord::Migration[5.1]
  def change
    add_column :providers, :waiver, :text, array:true, default: []
  end
end
