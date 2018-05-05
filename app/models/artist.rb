class Artist < ActiveRecord::Base
  #has no connection to song_genres table
  has_many :songs
  has_many :genres, through: :songs

  def slug
    name.downcase.gsub(" ", "-") #gives us e.g. "taylor-swift"
  end

  def self.find_by_slug(slug)
    Artist.all.find{|artist| artist.slug == slug}
  end
end
