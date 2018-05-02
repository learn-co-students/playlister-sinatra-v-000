class Genre < ActiveRecord::Base

  has_many :song_genres
  has_many :songs, :through => :song_genres
  has_many :artists, :through => :songs
  

  def slug
    self.name.downcase.strip.gsub(' ','-')
  end

  def self.find_by_slug(genre_slug)
    Genre.all.find {|genre| genre.slug == genre_slug}
  end

end