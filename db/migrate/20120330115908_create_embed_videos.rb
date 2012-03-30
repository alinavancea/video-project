class CreateEmbedVideos < ActiveRecord::Migration
  def change
    create_table :embed_videos do |t|
      t.integer :client_hash_id
      t.text :text

      t.timestamps
    end
  end
end
