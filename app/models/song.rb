class Song < ActiveRecord::Base
  extend Slugify::ClassMethods
  include Slugify::InstanceMethods
  belongs_to :artist
  has_many :genres, through: :song_genres
  has_many :song_genres

end

# @song = Song.create(name: 'hello')
# @song.build_artist("Adele") # this is unsaved (belongs_to)
# @song.create_artist("Adele") # this is saved (belongs_to)
# @song.genres.build("pop") # this is unsaved (has_many)
# @song.genres.create("pop") # this is saved (has_many)
#
# @song.genre_ids = [1,2,3,4] # assigns all the genres by ids
# @song.save
# @song.update(genre_ids: [1,2,3,4]) #automatically saves
# @song.artist = Artist.find_or_create_by(name: "Adele")
# @song.artist # returns the artist object
