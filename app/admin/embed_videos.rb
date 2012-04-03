ActiveAdmin.register EmbedVideo do
  config.clear_sidebar_sections!

    index do
        div  render :partial => "admin/embed_videos/index",:class => "main_content_wrapper"
    end

    controller do
        def save_position(object={}, &block)
            hash = params[:hash]
            hash.size().times do |i|
                video = EmbedVideo.find(hash[i])
                video.position = i
                video.save
            end
            render :nothing => true
        end
    end

  
end
