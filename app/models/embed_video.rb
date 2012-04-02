class EmbedVideo < ActiveRecord::Base
    belongs_to :client_hash
    validates :text, :presence => true
  
    after_create :lock
  
    attr_accessor :is_locked

    def small_video
    
    end

    def image_url
        img_url = ""
        if self.text.present?
            video_id = self.text.split("/").last
            img_url = "http://img.youtube.com/vi/#{video_id}/1.jpg"
        end
        img_url
    end

    def embed_url
        url = ""
        if self.text.present?
            video_id = self.text.split("/").last
            url = "http://www.youtube.com/embed/#{video_id}"
        end
        url
    end
  
    def is_locked?
        self.is_locked
    end

    def unlock
        self.is_locked = false
    end
  
    def lock
        self.is_locked = true
    end
end
