class SongGenre < ActiveRecord::Base
  belongs_to :song 
  belongs_to :genre
   def slug
    self.name.downcase.gsub(" ","-").gsub(/[^\w-]/, '')
  end

  def self.find_by_slug(slug)
    SongGenre.all.find{|songgenre| songgenre.slug == slug}
  end
end