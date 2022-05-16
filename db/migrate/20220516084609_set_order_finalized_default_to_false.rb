class SetOrderFinalizedDefaultToFalse < ActiveRecord::Migration[7.0]
  def change
    change_column_default :orders, :finalised, to: false
  end
end
