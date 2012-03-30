class ClientHash < ActiveRecord::Base
  belongs_to :client
  has_many :comments
  has_many :embed_videos
  def display_name
        text
  end

  validates :text, :presence => true
end
