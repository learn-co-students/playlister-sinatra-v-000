class Artist < ActiveRecord::Base
  has_many :songs

  def genres
    genre_list = Set.new
    self.songs.each { |song| song.genres.each { |genre| genre_list << genre } }
    genre_list
  end

  def slug
    ApplicationController.slug(self.name)
  end

  def self.find_by_slug(slug)
    Artist.all.detect { |artist| artist.slug == slug }
  end

end
