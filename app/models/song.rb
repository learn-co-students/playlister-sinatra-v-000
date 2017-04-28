class Song < ActiveRecord::Base

  has_many :song_genres
  has_many :genres, through: :song_genres
  has_many :artists, through: :songs

  # include Slugifiable::InstanceMethods
  # extend Slugifiable::ClassMethods

end
