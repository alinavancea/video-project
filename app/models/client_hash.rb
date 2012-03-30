class ClientHash < ActiveRecord::Base
  belongs_to :client
  has_many :comments
  has_many :embed_videos
end
