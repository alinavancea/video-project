class EmbedVideo < ActiveRecord::Base
  belongs_to :client_hash

  #after_create :lock
  
  def small_video
    
  end

  def is_locked?
    true
  end

  def unlock
    
  end
  
  def lock

  end
end
