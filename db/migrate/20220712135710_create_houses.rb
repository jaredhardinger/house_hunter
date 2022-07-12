class CreateHouses < ActiveRecord::Migration[5.2]
  def change
    create_table :houses do |t|
      t.string :address
      t.integer :price
      t.boolean :for_sale

      t.timestamps
    end
  end
end
