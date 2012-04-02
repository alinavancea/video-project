class HomeController < ApplicationController
    def index
        hash_id = params[:hash_id]
        @videos = []
        @hash = {}
        begin
            @hash  = ClientHash.find(hash_id)
            @unlocked_video = @hash .embed_videos.first
            count = @hash .counter
            @videos = @hash .embed_videos
        rescue ActiveRecord::RecordNotFound
      
        end
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
                hash.comments.create(:text => comment)
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
end
