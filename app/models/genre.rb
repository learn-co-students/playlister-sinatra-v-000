class Genre < ActiveRecord::Base
  include Slugifiable::InstanceMethods
  extend Slugifiable::KlassMethods
  has_many :songs_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs
end
