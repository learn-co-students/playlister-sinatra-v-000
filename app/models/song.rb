class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  def slug
    ApplicationController.slug(self.name)
  end

  def self.find_by_slug(slug)
    mod_slug = slug.downcase
    Song.all.detect { |song| song.slug.downcase == mod_slug }
  end

end
