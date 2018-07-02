require_relative './concerns/slugifiable'

class Song < ActiveRecord::Base
  include Slugifiable::InstanceMethods
  extend Slugifiable::ClassMethods

  belongs_to :artist
  has_many :song_genres #songs have a bunch of song-genre relationships
  has_many :genre, through: :song_genres #through that relationship, songs have a bunch of genres
end
