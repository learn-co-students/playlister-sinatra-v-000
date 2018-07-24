class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, :through => :song_genres
  has_many :songs, :through => :songs

  def slug
    name.downcase.gsub(" ","-")
  end

  def self.find_by_slug(slug)
    Genre.all.find{|genre| artist.slug == slug}
  end
end
