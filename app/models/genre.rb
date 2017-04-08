class Genre < ActiveRecord::Base

  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs

  extend Slugifiable::ClassMethods, FindOrCreate
  include Slugifiable::InstanceMethods

end
