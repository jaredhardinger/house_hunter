class AddLicensedRealtorToAgents < ActiveRecord::Migration[5.2]
  def change
    add_column :agents, :licensed_realtor, :boolean
  end
end
