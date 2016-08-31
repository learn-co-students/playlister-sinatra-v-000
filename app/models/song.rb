class Song < ActiveRecord::Base
  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods

  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres
end

# Song.create(name: "Keep It Moving")
#   => #<Song:0x007ff9998c9020 id: 1, name: "Keep It Moving">
