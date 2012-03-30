ActiveAdmin.register ClientHash do
    index do
        column "Hashtag", :text
        column "Created At", :created_at
        default_actions
    end
  
end
