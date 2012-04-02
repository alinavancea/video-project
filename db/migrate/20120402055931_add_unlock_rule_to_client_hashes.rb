class AddUnlockRuleToClientHashes < ActiveRecord::Migration
  def change
    add_column :client_hashes, :unlock_rule, :integer
  end
end
