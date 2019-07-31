require 'slugify'

class Song < ActiveRecord::Base
  # A Song can belong to ONE Artist and multiple genres
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  def slug
    name.slugify
    #.downcase.gsub(" ", '-')
  end

  def self.find_by_slug(slug)
    Song.all.find{ |song| song.slug == slug }
  end
end
