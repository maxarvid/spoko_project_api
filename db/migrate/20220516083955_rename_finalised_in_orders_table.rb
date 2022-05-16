class RenameFinalisedInOrdersTable < ActiveRecord::Migration[7.0]
  def change
    change_table :orders do |t|
      t.rename :Finalised, :finalised
    end
  end
end
