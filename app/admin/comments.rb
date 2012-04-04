ActiveAdmin.register Comment, :as => "HashComment" do

    controller do
        def destroy( options ={}, &block)
            
            client_hash_id = Comment.find(params[:id]).client_hash_id

            client_hash = ClientHash.find(client_hash_id)
            client_hash.counter -= 1
            client_hash.save
            
            destroy! do |format|
                format.html{ redirect_to admin_hash_comments_path}
            end
        end
    end

end
