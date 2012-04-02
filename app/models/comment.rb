class Comment < ActiveRecord::Base
  has_and_belongs_to_many :client_hashes
end
