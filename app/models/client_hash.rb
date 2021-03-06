class ClientHash < ActiveRecord::Base
  belongs_to :client
  has_many :embed_videos

  has_and_belongs_to_many :comments 
  
  def display_name
        text
  end

  validates :text, :presence => true

  def reset_counter
      self.counter = 0
      self.save
  end
end
