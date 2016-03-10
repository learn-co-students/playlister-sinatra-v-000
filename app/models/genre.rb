class Genre < ActiveRecord::Base
  has_many :artists, through: :songs
  has_many :songs, through: :song_genres
  has_many :song_genres

  def slug
  self.name.downcase.gsub!(" ", "-")
  end

  def self.find_by_slug(artist_name)
    Genre.all.find{|artist| artist.slug == artist_name}
  end
end