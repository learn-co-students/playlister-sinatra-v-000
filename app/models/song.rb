class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :genres, through: :song_genres
  has_many :song_genres

  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods

  def self.create_from_form(song_name, artist_name, genres)
    song = Song.new(name: song_name)
    if artist = Artist.find_by(name: artist_name)
      song.artist = artist
    else
      song.build_artist(name: artist_name)
    end
    song.save
    genres.each do |genre_id|
      song.genres << Genre.find_by_id(genre_id)
    end
    song
  end

  def self.update_from_form(slug, song_name, artist_name, genres)
    song = Song.find_by_slug(slug)
    song.update(name: song_name)
    song.artist.update(name: artist_name)
    updated_genres = []
    genres.each do |genre_id|
      updated_genres << Genre.find_by_id(genre_id)
    end
    song.genres = updated_genres
    song
  end
end
