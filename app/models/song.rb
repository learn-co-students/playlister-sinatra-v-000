class Song < ActiveRecord::Base
  
  belongs_to :artist
  
  def self.find_by_slug(slug)
    Song.all.find{|song| song.slug == slug}
  end
 
end