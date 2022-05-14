class AddFinalisedToOrder < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :Finalised, :boolean
  end
end
