class Genre < ActiveRecord::Base
  has_many :song_genres
  # has_many :artists, through: :song_genres
  #doesn't work because artist isn't part of join table
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs

  def slug
    name.downcase.gsub(" ", "-") #gives us e.g. "taylor-swift"
  end

  def self.find_by_slug(slug)
    Genre.all.find{|genre| genre.slug == slug}
  end
  
end
