class AddColumnToClientHash < ActiveRecord::Migration
  def change
    add_column :client_hashes, :position, :integer

  end
end
