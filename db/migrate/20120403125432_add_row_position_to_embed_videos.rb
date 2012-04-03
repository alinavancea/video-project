class AddRowPositionToEmbedVideos < ActiveRecord::Migration
  def change
    add_column :embed_videos, :row_position, :integer	

  end
end
