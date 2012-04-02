class HashComment < ActiveRecord::Base
   belongs_to :client_hash
   belongs_to :comment
end