class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, through: :song_genres

  def artists
    artist_list = Set.new
    self.songs.each { |song| artist_list << song.artist }
    artist_list
  end

  def slug
    ApplicationController.slug(self.name)
  end

  def self.find_by_slug(slug)
    Genre.all.detect { |genre| genre.slug == slug }
  end

end
