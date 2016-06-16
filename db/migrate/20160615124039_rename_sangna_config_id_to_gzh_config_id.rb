class RenameSangnaConfigIdToGzhConfigId < ActiveRecord::Migration[5.0]
  def change
	add_reference :users, :gzh_config, index: true
	remove_reference :users, :sangna_config
  end
end
