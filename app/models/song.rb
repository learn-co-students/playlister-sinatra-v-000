class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  def slug
      self.name.gsub(/ /, '-').downcase
  end

  def self.find_by_slug(slug)
    song_name = slug.gsub(/-/, ' ')
    #artist_name = artist_name.split.map {|w| w.capitalize }.join(' ')
    song_name = song_name.titleize
    Song.find_by name: song_name
  end
end
