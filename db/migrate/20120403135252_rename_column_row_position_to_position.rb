class RenameColumnRowPositionToPosition < ActiveRecord::Migration
  def change
     rename_column :embed_videos, :row_position, :position
  end
end
