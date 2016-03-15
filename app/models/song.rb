class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  include Slugifiable

  def slug
    Slugifiable.slug(self.name)
  end

  def self.find_by_slug(slug)
    Song.all.detect{ |song| Slugifiable.slug(song.name) == slug }
  end
end