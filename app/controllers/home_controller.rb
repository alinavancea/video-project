class HomeController < ApplicationController
    def index
        hash_id = params[:hash_id]
        @hash = {}
        @all_videos = []
        @next_unlock = nil
        begin
            
            @hash  = ClientHash.find(hash_id)
            @unlocked_video = @hash.embed_videos.first
            @all_videos = videos_as_hash( @hash )
            @next_unlock = @all_videos.detect{ |v| v[:is_locked] == true }
        rescue ActiveRecord::RecordNotFound

        end
    end

    def is_unlocked
        video = EmbedVideo.find(params[:video_id])
        videos = videos_as_hash(video.client_hash)
        video_h = videos.detect{ |v| v[:id] == video.id }
        if !video_h[:is_locked]
            message = "ok"
        else
            message = "locked"
        end
        render :text => message
    end
    def submit_comment
        #        hash_id = params["hash_id"]
        #        puts hash_id
        #        hash_id = 1
        comment = params[:text]
        hash_id = params[:hash_id].to_i
        ClientHash.all.each do |hash|
            if comment.include? '#'+hash.text
                hash.counter =hash.counter.to_i+1
                hash.comments.create(:text => comment,:client_hash_id => hash.id)
                hash.save
            end
            
        end
        hash = ClientHash.find(hash_id)
        render :layout => false, :text => hash.to_json(:include => :comments)


        #begin
        #    hash = ClientHash.find(hash_id)
        #    hash.comments.create(:text => params["comment"]["text"])

        # rescue ActiveRecord::RecordNotFound

        #end
        #redirect_to root_path(:hash_id => 1)
    end

    def videos_as_hash( hash )
        all_videos = []
        count = hash.counter
        videos = hash.embed_videos.order(:position)
        num = count/hash.unlock_rule
        unlocked_videos = videos.take(num)
        videos = videos - unlocked_videos

        unlocked_videos.each do |video|
            video_hash = {}
            video_hash =
               {
                :id => video.id,
                :image_url => video.image_url,
                :is_locked => false
            }
            all_videos << video_hash
        end

        videos.each do |video|
            video_hash = {}
            video_hash =
               {
                :id => video.id,
                :image_url => video.image_url,
                :is_locked => true
            }
            all_videos << video_hash
        end
        all_videos
    end
end
