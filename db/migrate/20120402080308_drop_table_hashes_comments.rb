class DropTableHashesComments < ActiveRecord::Migration
  def change
      drop_table :hashes_comments
  end
end
