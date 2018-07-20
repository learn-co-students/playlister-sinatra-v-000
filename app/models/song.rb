class Song < ActiveRecord::Base
  has_many :song_genres
  has_many :genres, through: :song_genres
  belongs_to :artist


  def slug
    song = self.name
    song = song.downcase
    song = song.split(" ")
    song.join("-")
  end

  def self.find_by_slug(slug)
    self.all.find do |song|
    song_name = slug.split('-')
  song_name = song_name.join(" ")
    song_name = song_name.titleize
      song.name == song_name
    end
  end

end
