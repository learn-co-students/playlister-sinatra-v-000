class SongGenre < ActiveRecord::Base
  belongs_to :song
  belongs_to :genre

  def self.find_by_slug(slug)
          self.all.find do |instance|
           instance.slug == slug
      end
  end
  
end
