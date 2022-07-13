class AddAgentsToHouses < ActiveRecord::Migration[5.2]
  def change
    add_reference :houses, :agent, foreign_key: true
  end
end
