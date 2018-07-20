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
  song_object = self.all.find do |song|
    d_song = song.name.downcase
    song_name = slug.split('-')
  song_name = song_name.join(" ")
      d_song == song_name
    end
  end


end
