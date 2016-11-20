class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, :through => :song_genres
  has_many :artists, :through => :songs

  # converts a genre name from "Alternative Rock" to "alternative-rock"
  def slug
    name.downcase.gsub(' ', '-')
  end

  # finds the genre by the slugified version of its name
  def self.find_by_slug(slug)
    Genre.all.find{|genre| genre.slug == slug}
  end

end