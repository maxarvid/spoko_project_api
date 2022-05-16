class SetOrderFinalizedDefaultFromTrueToFalse < ActiveRecord::Migration[7.0]
  def change
    change_column_default :orders, :finalised, from: true, to: false
  end
end
