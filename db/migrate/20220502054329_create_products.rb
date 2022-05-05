class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :size
      t.timestamps
      t.float :price
   
    end
  end
end
