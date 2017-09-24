require 'pry'

class Song < ActiveRecord::Base
  has_many :song_genres
  has_many :genres, through: :song_genres
  belongs_to :artist


  def slug
    song = self.name.downcase
    split_song = song.split(" ")
    new_song =split_song.join("-")

    return new_song
  end

  def self.find_by_slug(slug)
    Song.all.each do |song|
      ogsong = song.slug
      if ogsong == slug
        return song
      end
    end
  end

end
