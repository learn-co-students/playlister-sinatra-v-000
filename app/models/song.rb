class Song < ActiveRecord::Base
  include Slugifiable
  belongs_to :artist
  has_many :genres, through: :song_genres
  has_many :song_genres

  def self.find_by_slug(slug)
    self.all.find { |song| song.slug == slug }
  end

end