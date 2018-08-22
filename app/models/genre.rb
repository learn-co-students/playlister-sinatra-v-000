class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, :through => :song_genres
  has_many :artists, :through => :songs
  
  def self.find_by_slug(slug)
    self.all.find{|i| i.slug == slug}
  end
  
  def slug
    self.name.downcase.gsub(" ","-")
  end
end