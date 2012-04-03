ActiveAdmin.register ClientHash do
    index do
        column "Hashtag", :text
        column "Created At", :created_at
        default_actions
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
          h3 "Videos"
            ul :class => "nomarker-ul" do
                resource.embed_videos.each do |v|
                    li link_to( v.text, admin_embed_video_path(v) )
                end
            end
        
        end

  
end
