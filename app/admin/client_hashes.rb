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
    
    show :title => proc { resource.text } do
        section :class => "panel" do
            h3 "Hash Details"
            div do
                attributes_table_for resource do
                    row("Hash Text")     { resource.text }
                    row("Created At")    { resource.created_at }
                    
                end
            end
        end
            

        section  :class => "panel panel-table" do
            h3 "Comments"
            ul :class => "nomarker-ul" do
                resource.comments.each do |c|
                    li link_to( c.text, admin_hash_comment_path(c) )
                end
            end
        end
        
                
    end
    
    sidebar "Videos", :only => [:show] do
      div  render :partial => "admin/client_hash/show_embed_video",:class => "main_content_wrapper"
                    
    end

end
