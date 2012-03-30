class ClientHash < ActiveRecord::Base
  belongs_to :client
  has_many :comments
  has_many :embed_videos
<<<<<<< HEAD
  def display_name
        text
  end
=======

  validates :text, :presence => true
>>>>>>> c590a7fdecb8d3153337ad4b15cf36c8e0736a18
end
