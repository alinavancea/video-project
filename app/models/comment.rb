class Comment < ActiveRecord::Base
  has_and_belongs_to_many :client_hash
  has_many :hashes_comments
  has_many :client_hash , :through =>:hashes_comments
end
