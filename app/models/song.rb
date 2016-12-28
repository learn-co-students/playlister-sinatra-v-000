class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods

  def self.create_from_filename(filename)
    artist_name, song_name, genre_name = LibraryParser.new.parse_filename(filename)
    artist = Artist.find_or_create_by(name: artist_name)
    song = artist.songs.find_or_create_by(name: song_name)
    song.genres.find_or_create_by(name: genre_name)
    song
  end
end
