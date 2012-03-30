class ClientHash < ActiveRecord::Base
  belongs_to :client
  has_many :comments
  has_many :embed_videos
  has_many :hashes_comments
  has_many :comments , :through =>:hashes_comments
  
  def display_name
        text
  end

  validates :text, :presence => true
end
