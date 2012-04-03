ActiveAdmin.register ClientHash do
    config.clear_sidebar_sections!

    index do
        div  render :partial => "admin/client_hash/index",:class => "main_content_wrapper"
    end

    controller do
        def save_position(object={}, &block)
            hash = params[:hash]
            hash.size().times do |i|
                client = ClientHash.find(hash[i])
                client.position = i
                client.save
            end
            render :nothing => true
        end
    end
end
