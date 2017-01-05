class Genre < ActiveRecord::Base

  include Concerns::Slugifiable::InstanceMethods
  extend Concerns::Slugifiable::ClassMethods

  has_many :artists, through: :songs
  has_many :song_genres
  has_many :songs, through: :song_genres
end
