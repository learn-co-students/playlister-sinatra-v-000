class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, :through => :song_genres
  has_many :artists, :through => :songs
  
  # We are repeating a ton of code here. These two methods could go into a module.

  def slug
    name.downcase.gsub(" ","-")
  end

  def self.find_by_slug(slug)
    Genre.all.find{|genre| genre.slug == slug}
  end
end