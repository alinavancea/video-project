ActiveAdmin.register ClientHash do
    config.clear_sidebar_sections!

    index do
        div  render :partial => "admin/client_hash/index",:class => "main_content_wrapper"
    end

    form do |f|
        f.inputs "Client" do
            f.input :client_id
            f.input :text
            f.input :unlock_rule
            f.input :counter, :input_html => { :readonly => true }, :label => "Number of comments"
        end

        f.buttons        
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
        def delete_comment

            client_hash = ClientHash.find(params[:client_id])
            client_hash.counter -= 1
            client_hash.save

            comment = Comment.find(params[:id])
            comment.destroy
            
            redirect_to admin_client_hash_path(params[:client_id])
        end
    end
    
    show :title => proc { resource.text } do
        section :class => "panel" do
            h3 "Hash Details"
            div do
                attributes_table_for resource do
                    row("Hash Text")     { resource.text }
                    row("Created At")    { resource.created_at }
                    row("Unlock Rule")    { resource.unlock_rule }
                end
            end
        end
            

        section  :class => "panel panel-table" do
            h3 "#{resource.counter} Comments"
            ul :class => "nomarker-ul left" do
                resource.comments.each do |c|
                    li link_to( c.text, admin_hash_comment_path(c) )
                end
            end
            ul :class => "nomarker-ul right" do
                resource.comments.each do |c|
                    li link_to( "Delete", delete_comment_path(c.id,:client_id => params[:id]), :method => :post, :confirm => 'Are you sure you want to delete this comment?')
                end
            end
        end                
    end
    
    sidebar "Videos", :only => [:show] do
        div  render :partial => "admin/client_hash/show_embed_video",:class => "main_content_wrapper"
                    
    end

end
