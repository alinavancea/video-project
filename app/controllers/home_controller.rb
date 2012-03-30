class HomeController < ApplicationController
  def index
    hash_id = params[:hash_id]
    @videos = []
    begin

      hash = ClientHash.find(hash_id)
      @unlocked_video = hash.embed_videos.first
      count = hash.counter
      @videos = hash.embed_videos
    rescue ActiveRecord::RecordNotFound
      
    end
  end

  def submit_comment
      puts params
      redirect_to root_path
  end
end
