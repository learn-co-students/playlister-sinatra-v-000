class Song < ActiveRecord::Base
  
  belongs_to :artist
  has_many :song_genres
  has_many :genres, :through => :song_genres
  
  def self.find_by_slug(slug)
    Song.all.find{|song| song.slug == slug}
  end
  
  def self.find_by_slug(slug)
    self.all.find{|i| i.slug == slug}
  end
  
  def slug
    self.name.downcase.gsub(" ","-")
  end
 
end